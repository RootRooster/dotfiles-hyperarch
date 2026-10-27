#!/usr/bin/env bash
# Calculator (Super+Ctrl+C): qalc in a Cyber floating terminal. Same shortcut again closes it.
# qalc does math, unit/currency conversion and bases: "0x41 to dec", "5 GiB to MB", "100 USD to EUR".
if command -v qalc >/dev/null; then
    exec ~/.config/waybar/scripts/cyber-term.sh cyber-calc Calculator qalc
else
    notify-send -a "Calculator" "qalc is not installed" "sudo pacman -S libqalculate"
fi
