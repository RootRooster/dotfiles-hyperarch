#!/usr/bin/env bash
# Open a terminal app in a Cyber-themed floating kitty, or close it if it's already open.
#
#   cyber-term.sh <window-class> <title> <command...>
#
# The ANSI palette is remapped to the Cyber Neon colors, so TUI apps that use
# the standard 16 colors (bluetui, ...) pick up the theme automatically.

class="$1" title="$2"
shift 2

if hyprctl clients -j | jq -e --arg c "$class" 'any(.[]; .class == $c)' >/dev/null; then
  hyprctl dispatch "hl.dsp.window.close({ window = 'class:^($class)\$' })" >/dev/null
  exit 0
fi

# Per-app tweaks for apps with fixed color choices.
extra=()
case "$class" in
  cyber-bluetooth)
    # bluetui: green focus border -> cyan, yellow headers -> magenta, blue help -> muted
    extra=(-o color2="#00f0ff" -o color10="#7ff8ff"
           -o color3="#ff2bd6" -o color11="#ff7be6"
           -o color4="#5f8794" -o color12="#8fb8c4")
    ;;
esac

exec kitty --class "$class" --title "$title" \
  -o font_family="JetBrainsMono Nerd Font" \
  -o window_padding_width=14 \
  -o background_opacity=0.96 \
  -o background="#0b1017" \
  -o foreground="#c8f7ff" \
  -o cursor="#00f0ff" \
  -o selection_background="#00f0ff" \
  -o selection_foreground="#061016" \
  -o color0="#0b1017"  -o color8="#162130" \
  -o color1="#ff3355"  -o color9="#ff6b84" \
  -o color2="#39ff14"  -o color10="#7dff63" \
  -o color3="#ffb000"  -o color11="#ffcc4d" \
  -o color4="#3d7bff"  -o color12="#6aa0ff" \
  -o color5="#ff2bd6"  -o color13="#ff7be6" \
  -o color6="#00f0ff"  -o color14="#7ff8ff" \
  -o color7="#8fb8c4"  -o color15="#c8f7ff" \
  "${extra[@]}" \
  -e "$@"
