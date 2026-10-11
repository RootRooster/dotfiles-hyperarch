#!/usr/bin/env bash
#                                      __   
#   ___ ____ ___ _  ___ __ _  ___  ___/ /__ 
#  / _ `/ _ `/  ' \/ -_)  ' \/ _ \/ _  / -_)
#  \_, /\_,_/_/_/_/\__/_/_/_/\___/\_,_/\__/ 
# /___/                                     
# 

# Notifications
source "$HOME/.config/ml4w/scripts/ml4w-notification-handler"

_loadGameMode() {
    hyprctl eval 'hl.config({
        animations = { enabled = false },
        general    = { gaps_in = 0, gaps_out = 0, border_size = 1 },
        decoration = { rounding = 0, active_opacity = 1, inactive_opacity = 1, fullscreen_opacity = 1,
                       shadow = { enabled = false }, blur = { enabled = false } },
    })'
}

if [ -f $HOME/.config/ml4w/settings/gamemode-enabled ]; then
    _loadGameMode
    notify_user --a "System" \
        --i "joystick" \
        --s "Gamemode activated" \
        --m "Animations and blur are now disabled."
fi