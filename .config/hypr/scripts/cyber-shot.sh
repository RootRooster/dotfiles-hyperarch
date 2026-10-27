#!/usr/bin/env bash
source ~/.config/hypr/scripts/menu-toggle.sh; menu_toggle screenshot || exit 0   # same shortcut again closes it
# Cyber screenshot menu — keyboard first, vim keys.
#
#   j / k        move down / up          a  area      w  window
#   l / Enter    take the selected one   s  screen    f  all screens
#   q / h / Esc  cancel                  d  delayed   e  area → editor
#
#   lowercase key / l / Enter          → copy to the clipboard only
#   Shift+key / L / Shift+Enter        → copy AND save (folder / filename from
#                                        ~/.config/cyber/settings/screenshot-folder and -filename)
#
# Bound to Ctrl+Shift+4 and Super+Print in ~/.config/hypr/conf/custom.conf.

eval folder="$(cat ~/.config/cyber/settings/screenshot-folder 2>/dev/null || echo '~/Pictures')"
eval name="$(cat ~/.config/cyber/settings/screenshot-filename 2>/dev/null || echo 'screenshot_$(date +%Y%m%d_%H%M%S).png')"
editor="$(cat ~/.config/cyber/settings/screenshot-editor 2>/dev/null)"

saved="$folder/$name"
# Every capture is taken as PNG (the clipboard requires it) into a temp file,
# which also feeds the notification preview and the editor.
scratch="${XDG_RUNTIME_DIR:-/tmp}/cyber-shot.png"

# Selection overlay in the Cyber palette
export SLURP_ARGS="-b #0b101799 -c #00f0ffff -s #00f0ff1a -B #ff2bd622 -w 2"

dim() { printf "<span foreground='#4a6b78'>%s</span>" "$1"; }
key() { printf "<span foreground='#ff2bd6'>%s</span>" "$1"; }
row() { printf '%s  %-8s %s  %s\n' "$1" "$2" "$(dim "$(printf '%-24s' "$3")")" "$(key "$4")"; }

# menu TITLE HINT KEYS... (rows on stdin)
# Prints "index" (l/Enter), "save:index" (L/Shift+Enter) or "custom:N" (Nth key).
menu() {
  local title="$1" hint="$2"; shift 2
  local args=() i=1 out code rows
  rows=$(cat)
  for k in "$@"; do args+=(-kb-custom-$i "$k"); i=$((i + 1)); done
  out=$(printf '%s\n' "$rows" | rofi -dmenu -config ~/.config/rofi/cyber-menu.rasi -markup-rows -format i \
        -l "$(( $(printf '%s\n' "$rows" | wc -l) + 1 ))" \
        -theme-str "textbox-title { str: \"$title\"; }" \
        -mesg "$hint" \
        -kb-row-down "j,Down" -kb-row-up "k,Up" \
        -kb-accept-entry "l,Return,KP_Enter" -kb-cancel "q,h,Escape" \
        -kb-accept-alt "" -kb-accept-custom "" -kb-accept-custom-alt "" \
        -kb-mode-next "" -kb-mode-previous "" -kb-remove-char-back "BackSpace" \
        -kb-custom-19 "Shift+l,Shift+Return" \
        "${args[@]}")
  code=$?
  if [ "$code" -eq 28 ]; then echo "save:$out"
  elif [ "$code" -ge 10 ]; then echo "custom:$((code - 9))"
  elif [ "$code" -eq 0 ]; then echo "$out"
  fi
}

shoot() {  # shoot SAVE TARGET [extra grimblast args...]
  local save="$1" target="$2"; shift 2
  file="$scratch"
  sleep 0.25   # let the menu fade out so it isn't captured
  grimblast "$@" copysave "$target" "$scratch" >/dev/null || return 1
  if [ "$save" -eq 1 ]; then
    mkdir -p "$folder"
    # Save in the format the filename asks for (e.g. .jpg → real JPEG)
    case "${saved,,}" in
      *.png) cp "$scratch" "$saved" ;;
      *)     magick "$scratch" "$saved" ;;
    esac || return 1
    file="$saved"
    notify-send -a "Screenshot" -i "$file" "Screenshot copied & saved" "${file/#$HOME/\~}"
  else
    notify-send -a "Screenshot" -i "$file" "Screenshot copied" "clipboard only"
  fi
}

delay_menu() {  # delay_menu SAVE
  local save="$1" pick secs mode="copy"
  [ "$save" -eq 1 ] && mode="copy + save"
  pick=$(printf '%s\n' \
    "$(row '󱎫' '3 SEC'  'current screen' '3')" \
    "$(row '󱎫' '5 SEC'  'current screen' '5')" \
    "$(row '󱎫' '10 SEC' 'current screen' '0')" |
    menu "󰄀  SCREENSHOT · DELAY · ${mode^^}" "$(dim 'j/k move · l pick · q back')" 3 5 0)
  case "$pick" in
    0|save:0|custom:1) secs=3 ;;
    1|save:1|custom:2) secs=5 ;;
    2|save:2|custom:3) secs=10 ;;
    *) exec "$0" ;;   # back to the main menu
  esac
  for ((n = secs; n > 0; n--)); do
    notify-send -a "Screenshot" -t 1000 -h string:x-canonical-private-synchronous:cyber-shot "Screenshot in ${n}…"
    sleep 1
  done
  shoot "$save" output
}

pick=$(printf '%s\n' \
  "$(row '󰩭' 'AREA'   'select a region'      'a · A')" \
  "$(row '󰖯' 'WINDOW' 'active window'        'w · W')" \
  "$(row '󰍹' 'SCREEN' 'current monitor'      's · S')" \
  "$(row '󰍺' 'ALL'    'every monitor'        'f · F')" \
  "$(row '󱎫' 'DELAY'  'screen after a timer' 'd · D')" \
  "$(row '󰏫' 'EDIT'   "area → ${editor:-editor}" 'e · E')" |
  menu "󰄀  SCREENSHOT" \
       "$(dim "key = copy   ·   Shift+key = copy + save → ${folder/#$HOME/\~}")&#10;$(dim 'j/k move · l pick (L save) · q quit')" \
       a w s f d e Shift+a Shift+w Shift+s Shift+f Shift+d Shift+e)

# Lowercase keys (custom 1–6) / l copy; Shift keys (custom 7–12) / L save
save=0
case "$pick" in
  custom:*) n=${pick#custom:}; [ "$n" -gt 6 ] && { save=1; n=$((n - 6)); }; choice=$((n - 1)) ;;
  save:*)   save=1; choice=${pick#save:} ;;
  "")       exit 0 ;;
  *)        choice=$pick ;;
esac

case "$choice" in
  0) shoot "$save" area --freeze ;;
  1) shoot "$save" active ;;
  2) shoot "$save" output ;;
  3) shoot "$save" screen ;;
  4) delay_menu "$save" ;;
  5) shoot "$save" area --freeze && [ -n "$editor" ] && setsid -f "$editor" "$file" >/dev/null 2>&1 ;;
esac
