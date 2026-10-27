#!/usr/bin/env bash
source ~/.config/hypr/scripts/menu-toggle.sh; menu_toggle emoji || exit 0   # same shortcut again closes it
# Emoji picker (replaces the ML4W Sidebar app): rofimoji, styled by ~/.config/rofi/config.rasi
if command -v rofimoji >/dev/null; then
    rofimoji
else
    notify-send -a "Emoji" "rofimoji is not installed" "sudo pacman -S rofimoji"
fi
