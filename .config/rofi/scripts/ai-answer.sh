#!/usr/bin/env bash
# Live chat window for the rofi AI tab (runs inside a Cyber kitty, class cyber-ai).
#
# Streams Claude Haiku's reply as it is generated and copies it to the clipboard.
# Then a ❯ prompt lets you ask follow-ups in the same conversation
# (the CLI session is resumed, so Claude remembers the earlier exchange).
# Empty Enter or Ctrl+D closes the window.

STATE="${XDG_RUNTIME_DIR:-/tmp}/rofi-ai"
SYSTEM_PROMPT='You answer quick questions typed into a desktop launcher. Reply with only the answer: one short sentence, or a single command or value. No preamble, no explanation, no markdown, no code fences. Only give more detail if the question explicitly asks for it. Follow-up questions refer to the earlier exchange.'

DIM=$'\e[38;2;74;107;120m'
FG=$'\e[38;2;200;247;255m'
ACC=$'\e[38;2;0;240;255m'
ACC2=$'\e[38;2;255;43;214m'
ALERT=$'\e[38;2;255;51;85m'
RST=$'\e[0m'

cd "$STATE" || exit 1
session=""

# Word wrapping: print whole words, breaking lines between words (never mid-word)
col=0
word=""
flush_word() {
  [ -z "$word" ] && return
  if [ "$col" -gt 0 ] && [ $(( col + ${#word} )) -gt "$cols" ]; then
    printf '\n'
    col=0
  fi
  printf '%s' "$word"
  col=$(( col + ${#word} ))
  word=""
}

# ask QUESTION — stream the answer into the window and $STATE/last
ask() {
  local question="$1" first=1 ch
  local resume=()
  [ -n "$session" ] && resume=(--resume "$session")

  cols=$(( $(tput cols) - 1 ))
  col=0
  word=""
  : > "$STATE/last"

  printf '%sthinking…%s' "$DIM" "$RST"

  while IFS= read -r -d '' -n 1 ch; do
    if [ "$first" -eq 1 ]; then
      printf '\r\e[K%s' "$ACC"                      # replace "thinking…" with the answer
      first=0
    fi
    printf '%s' "$ch" >> "$STATE/last"
    case "$ch" in
      $'\n')
        flush_word; printf '\n'; col=0 ;;
      ' ')
        flush_word
        if [ "$col" -gt 0 ] && [ "$col" -lt "$cols" ]; then printf ' '; col=$(( col + 1 )); fi ;;
      *)
        word+="$ch"
        [ "${#word}" -ge "$cols" ] && flush_word ;;
    esac
  done < <(
    timeout 90 claude -p "$question" "${resume[@]}" \
      --model haiku \
      --effort low \
      --system-prompt "$SYSTEM_PROMPT" \
      --tools "" \
      --strict-mcp-config \
      --setting-sources "" \
      --output-format stream-json --verbose --include-partial-messages \
      < /dev/null 2> "$STATE/err" |
    tee "$STATE/stream.jsonl" |
    jq --unbuffered -rj 'select(.type == "stream_event"
                                and .event.type == "content_block_delta"
                                and .event.delta.type == "text_delta")
                         | .event.delta.text'
  )
  flush_word
  printf '%s\n\n' "$RST"

  # Remember the session so follow-ups continue the same conversation
  local sid
  sid=$(jq -r 'select(.session_id != null) | .session_id' "$STATE/stream.jsonl" 2>/dev/null | tail -n 1)
  [ -n "$sid" ] && session="$sid"

  if [ -s "$STATE/last" ]; then
    wl-copy < "$STATE/last" >/dev/null 2>&1   # detached from the tty, or kitty stays open
    printf '%s󰆏 copied · type a follow-up, or press Enter on an empty line to close%s\n' "$DIM" "$RST"
  else
    printf '\r\e[K%s⚠ no answer%s %s%s%s\n' "$ALERT" "$RST" "$DIM" "$(tail -n 2 "$STATE/err")" "$RST"
    printf '%stry again, or press Enter on an empty line to close%s\n' "$DIM" "$RST"
  fi
}

question=$(cat "$STATE/question")
printf '%s❯ %s%s%s\n\n' "$ACC2" "$FG" "$question" "$RST"
ask "$question"

while true; do
  printf '\n'
  IFS= read -e -r -p $'\001'"$ACC2"$'\002''❯ '$'\001'"$FG"$'\002' next || break
  printf '%s' "$RST"
  [ -z "${next// /}" ] && break
  printf '%s' "$next" > "$STATE/question"
  printf '\n'
  ask "$next"
done

# Remove the saved chat session; nothing needs to be kept
if [ -n "$session" ]; then
  find "$HOME/.claude/projects" -name "$session.jsonl" -delete 2>/dev/null
fi
