#!/usr/bin/env bash
# rofi "AI" tab: ask your personal agent (Claude Code, lives in ~/.local/share/cyber-agent)
# (uses your Claude subscription login).
#
# Type a question in the AI tab and press Enter: rofi closes and a floating Cyber
# window (ai-answer.sh) streams the answer live, then copies it to the clipboard.
#
# rofi script-mode protocol: ROFI_RETV=0 tab opened, 2 custom text entered.
# Printing no rows after Enter makes rofi close, which is what we want here.

STATE="${XDG_RUNTIME_DIR:-/tmp}/rofi-ai"
mkdir -p "$STATE"

# Escape for pango markup; newlines become &#10; because rofi reads one row per line.
esc() { sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' | awk 'NR > 1 { printf "&#10;" } { printf "%s", $0 }'; }

case "${ROFI_RETV:-0}" in
  2)
    # A question was typed and Enter pressed: hand it to the live answer window.
    printf '%s' "$1" > "$STATE/question"

    # Replace an answer window that is still open
    if hyprctl clients -j | jq -e 'any(.[]; .class == "cyber-ai")' >/dev/null; then
      hyprctl dispatch "hl.dsp.window.close({ window = 'class:^(cyber-ai)\$' })" >/dev/null
      sleep 0.3
    fi

    setsid -f ~/.config/waybar/scripts/cyber-term.sh cyber-ai Claude \
      ~/.config/rofi/scripts/ai-answer.sh >/dev/null 2>&1
    ;;
  *)
    # Tab opened
    printf '\0prompt\x1fAI\n'
    printf '\0no-custom\x1ffalse\n'
    if [ -s "$STATE/last" ]; then
      printf '\0message\x1f<span foreground="#4a6b78">last · ❯ %s</span>&#10;&#10;%s&#10;&#10;<span foreground="#4a6b78" size="small">type a new question and press Enter</span>\n' \
        "$(esc < "$STATE/question")" "$(esc < "$STATE/last")"
    else
      printf '\0message\x1f<span foreground="#4a6b78">Ask your agent: shortcuts, your setup, tasks, or what is on screen. Enter to send.</span>\n'
    fi
    ;;
esac
