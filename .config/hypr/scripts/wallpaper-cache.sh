#!/usr/bin/env bash

# Notifications
source "$HOME/.config/cyber/scripts/cyber-notification-handler"

cyber_cache_folder="$HOME/.cache/cyber"
generated_versions="$cyber_cache_folder/wallpaper-generated"
rm $generated_versions/*
echo ":: Wallpaper cache cleared"
notify_user \
        --a "System" \
        --m "Wallpaper cache cleared"
