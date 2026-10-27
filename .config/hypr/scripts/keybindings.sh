#!/usr/bin/env bash
source ~/.config/hypr/scripts/menu-toggle.sh; menu_toggle keybinds || exit 0   # same shortcut again closes it
#    __            __   _         ___             
#   / /_____ __ __/ /  (_)__  ___/ (_)__  ___ ____
#  /  '_/ -_) // / _ \/ / _ \/ _  / / _ \/ _ `(_-<
# /_/\_\\__/\_, /_.__/_/_//_/\_,_/_/_//_/\_, /___/
#          /___/                        /___/     
# 

# -----------------------------------------------------
# Load Launcher
# -----------------------------------------------------
launcher=$(cat $HOME/.config/cyber/settings/launcher)

# -----------------------------------------------------
# Read the live binds (descriptions come from hl.bind in lua/keybindings.lua)
# -----------------------------------------------------
keybinds=$(hyprctl binds -j | jq -r '
    def mods:
        [ (if (.modmask / 64 | floor) % 2 == 1 then "SUPER" else empty end),
          (if (.modmask / 4  | floor) % 2 == 1 then "CTRL"  else empty end),
          (if (.modmask / 8  | floor) % 2 == 1 then "ALT"   else empty end),
          (if  .modmask             % 2 == 1 then "SHIFT" else empty end) ];
    .[]
    | (if .key != "" then .key else "code:\(.keycode)" end) as $key
    | (mods + [$key | ascii_upcase] | join(" + ")) as $combo
    | (if .has_description then .description else "\(.dispatcher) \(.arg)" end) as $desc
    | "\($combo)\r  \($desc)"
')

sleep 0.2

if [ "$launcher" == "walker" ]; then
    keybinds=$(echo -n "$keybinds" | tr '\r' ':')
    $HOME/.config/walker/launch.sh -d -N -H -p "Search Keybinds" <<<"$keybinds"
else
    rofi -dmenu -i -markup -eh 2 -replace -p "Keybinds" -config ~/.config/rofi/config-compact.rasi <<<"$keybinds"
fi