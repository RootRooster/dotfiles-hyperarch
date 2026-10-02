#!/usr/bin/env bash
# Screen shaders (full-screen filters), applied straight through Hyprland.
#
#   hyprshade.sh        toggle the saved shader on/off   (Waybar tools drawer → shader icon, left click)
#   hyprshade.sh rofi   pick a shader                    (right click)
#
# hyprshade 5.x speaks the newer Lua-config syntax that Hyprland 0.56 doesn't
# understand yet, so this sets decoration:screen_shader with hyprctl instead.
# Shader files come from the hyprshade package (/usr/share/hyprshade/shaders).

SHADERS=/usr/share/hyprshade/shaders
SETTING=~/.config/ml4w/settings/hyprshade.sh   # remembers the last picked shader
DEFAULT=blue-light-filter

current() {
  local path
  path=$(hyprctl getoption decoration:screen_shader -j | jq -r '.str // empty')
  [ -n "$path" ] && [ "$path" != "[[EMPTY]]" ] && basename "$path" .glsl
}

label() {
  case "$1" in
    blue-light-filter) echo "󰖔  Night light    warm screen, less blue light" ;;
    vibrance)          echo "󰏘  Vibrance       stronger colors" ;;
    off)               echo "󰅖  Off            normal colors" ;;
    *)                 echo "󰏘  $1" ;;
  esac
}

apply() {
  if [ "$1" = "off" ]; then
    hyprctl keyword decoration:screen_shader "[[EMPTY]]" >/dev/null
    notify-send -a "Screen shader" "Screen shader off"
  else
    hyprctl keyword decoration:screen_shader "$SHADERS/$1.glsl" >/dev/null
    notify-send -a "Screen shader" "$(label "$1" | sed 's/^[^ ]*  //; s/  .*//')" "Toggle it from the Waybar tools drawer (shader icon)"
  fi
}

if [ "$1" = "rofi" ]; then
  source ~/.config/hypr/scripts/menu-toggle.sh; menu_toggle shader || exit 0

  active=$(current)
  names=()
  for f in "$SHADERS"/*.glsl; do names+=("$(basename "$f" .glsl)"); done
  names+=(off)

  rows=""
  for n in "${names[@]}"; do
    mark="  "; { [ "$n" = "$active" ] || { [ -z "$active" ] && [ "$n" = off ]; }; } && mark="● "
    rows+="$mark$(label "$n")"$'\n'
  done

  idx=$(printf '%s' "$rows" | rofi -dmenu -config ~/.config/rofi/config-hyprshade.rasi -i -format i \
          -p "Shader" -l "$(( ${#names[@]} + 1 ))" \
          -mesg "<span foreground='#4a6b78'>● = active · Enter apply · Esc close</span>")
  [ -z "$idx" ] && exit 0

  choice=${names[$idx]}
  echo "hyprshade_filter=\"$choice\"" > "$SETTING"
  apply "$choice"
else
  hyprshade_filter=$DEFAULT
  [ -f "$SETTING" ] && source "$SETTING"
  [ "$hyprshade_filter" = "off" ] && hyprshade_filter=$DEFAULT

  if [ -n "$(current)" ]; then apply off; else apply "$hyprshade_filter"; fi
fi
