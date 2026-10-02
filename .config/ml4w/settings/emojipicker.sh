#!/usr/bin/env bash
# Emoji picker (replaces the ML4W Sidebar app): rofimoji, styled by ~/.config/rofi/config.rasi
if command -v rofimoji >/dev/null; then
    rofimoji
else
    notify-send -a "Emoji" "rofimoji is not installed" "sudo pacman -S rofimoji"
fi
