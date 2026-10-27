#!/usr/bin/env bash
#     _         _         __        ______
#    / \  _   _| |_ ___   \ \      / /  _ \
#   / _ \| | | | __/ _ \   \ \ /\ / /| |_) |
#  / ___ \ |_| | || (_) |   \ V  V / |  __/
# /_/   \_\__,_|\__\___/     \_/\_/  |_|
#

cyber_cache_folder="$HOME/.cache/cyber"

# Notifications
source "$HOME/.config/cyber/scripts/cyber-notification-handler"
APP_NAME="Waypaper"
NOTIFICATION_ICON="preferences-desktop-wallpaper-symbolic"

sec=$(cat ~/.config/cyber/settings/wallpaper-automation.sh)
_setWallpaperRandomly() {
    waypaper --random
    echo ":: Next wallpaper in 60 seconds..."
    sleep $sec
    _setWallpaperRandomly
}

if [ ! -f $cyber_cache_folder/wallpaper-automation ]; then
    touch $cyber_cache_folder/wallpaper-automation
    echo ":: Start wallpaper automation script"
    notify_user \
        --a "${APP_NAME}" \
        --i "${NOTIFICATION_ICON}" \
        --m "Wallpaper automation process started.\nWallpaper will be changed every $sec seconds."
    _setWallpaperRandomly
else
    rm $cyber_cache_folder/wallpaper-automation
    notify_user \
        --a "${APP_NAME}" \
        --i "${NOTIFICATION_ICON}" \
        --m "Wallpaper automation process stopped."
    echo ":: Wallpaper automation script process $wp stopped"
    wp=$(pgrep -f wallpaper-automation.sh)
    kill -KILL $wp
fi
