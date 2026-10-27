#!/usr/bin/env bash
# Live chat window for the rofi AI tab (runs inside a Cyber kitty, class cyber-ai).
#
# Talks to nixson's personal agent, a Claude Code session that lives in
# ~/.local/share/cyber-agent (instructions in AGENT.md, long-term memory in memory/,
# saved automations in scripts/, tools like `see-screen` in bin/). It can read files,
# run commands and look at the screen without asking.
#
# Haiku answers first. When a question needs the screen or a multi-step task, Haiku
# runs `agent-escalate` and Sonnet takes over the same conversation for the rest of the window.
#
# The reply streams in live (tool use shows as dim · lines) and the final answer is
# copied to the clipboard. A ❯ prompt lets you ask follow-ups in the same conversation.
# Empty Enter or Ctrl+D closes the window.

STATE="${XDG_RUNTIME_DIR:-/tmp}/rofi-ai"
AGENT_HOME="$HOME/.local/share/cyber-agent"

export PATH="$AGENT_HOME/bin:$PATH"
export CLAUDE_CODE_DISABLE_AUTO_MEMORY=1   # the agent keeps its own memory in memory/

DIM=$'\e[38;2;74;107;120m'
FG=$'\e[38;2;200;247;255m'
ACC=$'\e[38;2;0;240;255m'
ACC2=$'\e[38;2;255;43;214m'
ALERT=$'\e[38;2;255;51;85m'
RST=$'\e[0m'

cd "$AGENT_HOME" || exit 1
session=""
model=haiku

# System prompt: AGENT.md + which model is answering + the current memory and saved scripts.
# Rebuilt for every question so memory saved a moment ago is already included.
build_prompt() {
  cat AGENT.md
  printf '\n## Model\n\n'
  if [ "$model" = haiku ]; then
    printf '%s\n' "You are the fast model (Haiku). If the question needs the screen (a screenshot) or a" \
      "multi-step task (writing and running a script, several commands that change things), run" \
      "\`agent-escalate\` and end your turn without writing anything: Sonnet takes over this conversation." \
      "Answer everything else yourself, including looking things up in files and saving memory."
  else
    printf '%s\n' "You are Sonnet. Handle questions fully yourself. Never run \`agent-escalate\`. Remember: plain text only, no ** or other markdown."
  fi
  printf '\nToday is %s.\n' "$(date '+%A, %Y-%m-%d %H:%M')"

  printf '\n## Your memory (memory/)\n\n'
  local f found=0
  for f in memory/*.md; do
    [ -s "$f" ] || continue
    found=1
    printf '### %s\n\n%s\n\n' "$f" "$(cat "$f")"
  done
  [ "$found" -eq 0 ] && printf '(empty)\n'

  printf '\n## Your saved scripts (scripts/)\n\n'
  found=0
  for f in scripts/*; do
    [ -f "$f" ] || continue
    found=1
    printf -- '- %s: %s\n' "$f" "$(grep -m 1 '^#[^!]' "$f" | sed 's/^#* *//')"
  done
  [ "$found" -eq 0 ] && printf '(none)\n'
}

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

# run PROMPT — one agent turn with $model, streamed into the window and $STATE/last.
# Tool calls arrive wrapped in \x01 … \x02 and are shown as dim lines; text written
# before a tool call is dropped from $STATE/last so only the final answer is copied.
run() {
  local prompt="$1" first=1 intool=0 muted=0 ch limit=120
  local resume=()
  [ -n "$session" ] && resume=(--resume "$session")
  [ "$model" = sonnet ] && limit=300

  build_prompt > "$STATE/system.md"
  : > "$STATE/last"
  rm -f "$STATE/last.before-tool"
  printf '%sthinking…%s' "$DIM" "$RST"

  while IFS= read -r -d '' -n 1 ch; do
    # \x03: Haiku handed the question to Sonnet, so whatever it writes next is noise
    if [ "$ch" = $'\x03' ]; then muted=1; fi
    [ "$muted" -eq 1 ] && continue
    if [ "$first" -eq 1 ]; then
      printf '\r\e[K%s' "$ACC"                      # replace "thinking…" with the answer
      first=0
    fi
    case "$ch" in
      $'\x01')
        flush_word
        [ "$col" -gt 0 ] && printf '\n'
        printf '%s· ' "$DIM"
        intool=1 ;;
      $'\x02')
        printf '%s\n' "$ACC"
        col=0
        intool=0
        [ -s "$STATE/last" ] && mv "$STATE/last" "$STATE/last.before-tool"
        : > "$STATE/last" ;;
      *)
        if [ "$intool" -eq 1 ]; then
          printf '%s' "$ch"
          continue
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
        esac ;;
    esac
  done < <(
    timeout "$limit" claude -p "$prompt" "${resume[@]}" \
      --model "$model" \
      --effort low \
      --system-prompt-file "$STATE/system.md" \
      --tools Bash,Read,Write,Edit,Glob,Grep \
      --permission-mode bypassPermissions \
      --strict-mcp-config \
      --setting-sources "" \
      --output-format stream-json --verbose --include-partial-messages \
      < /dev/null 2> "$STATE/err" |
    tee "$STATE/stream.jsonl" |
    jq --unbuffered -rj --arg home "$HOME" --argjson w $(( cols - 3 )) '
      def short: gsub("\\s+"; " ") | if length > $w then .[0:$w - 1] + "…" else . end;
      if .type == "stream_event" and .event.type == "content_block_delta"
         and .event.delta.type == "text_delta" then
        .event.delta.text
      elif .type == "assistant" then
        .message.content[]? | select(.type == "tool_use")
        | if (.input.command // "" | test("agent-escalate")) then "\u0003" else
          (.input.description // .input.command // .input.file_path // .input.pattern // "") as $arg
        | "\u0001" + ("\(.name) \($arg | tostring | sub("^" + $home; "~"))" | short) + "\u0002" end
      else empty end'
  )
  flush_word
  printf '%s' "$RST"

  # The agent answered and then still used a tool (e.g. saved memory): keep that answer
  if [ ! -s "$STATE/last" ] && [ -s "$STATE/last.before-tool" ]; then
    mv "$STATE/last.before-tool" "$STATE/last"
  fi

  # Remember the session so follow-ups continue the same conversation
  local sid
  sid=$(jq -r 'select(.session_id != null) | .session_id' "$STATE/stream.jsonl" 2>/dev/null | tail -n 1)
  [ -n "$sid" ] && session="$sid"
}

# ask QUESTION — answer with Haiku, or Sonnet once Haiku has escalated
ask() {
  cols=$(( $(tput cols) - 1 ))
  col=0
  word=""
  rm -f "$STATE/escalate"

  run "$1"

  if [ -e "$STATE/escalate" ] && [ "$model" = haiku ]; then
    rm -f "$STATE/escalate"
    model=sonnet                                     # stays on Sonnet for this window
    [ "$col" -gt 0 ] && printf '\n'
    printf '\r\e[K%s↗ handing over to Sonnet%s\n' "$DIM" "$RST"
    run "Handle my previous question above fully."
  fi
  printf '\n\n'

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

# Remove the chat transcript; what the agent wants to keep is in its memory/
if [ -n "$session" ]; then
  find "$HOME/.claude/projects" -name "$session.jsonl" -delete 2>/dev/null
fi
