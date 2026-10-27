#!/usr/bin/env bash
#     _    _ _  __ _             _
#    / \  | | |/ _| | ___   __ _| |_
#   / _ \ | | | |_| |/ _ \ / _` | __|
#  / ___ \| | |  _| | (_) | (_| | |_
# /_/   \_\_|_|_| |_|\___/ \__,_|\__|
#

# Float every window on the workspace, or tile them all if none are tiled
hyprctl eval '
local wins = hl.get_workspace_windows(hl.get_active_workspace())
local any_tiled = false
for _, w in ipairs(wins) do if not w.floating then any_tiled = true end end
for _, w in ipairs(wins) do
    hl.dispatch(hl.dsp.window.float({ window = "address:" .. w.address, action = any_tiled and "enable" or "disable" }))
end'

# Notifications
source "$HOME/.config/cyber/scripts/cyber-notification-handler"

notify_user \
        --a "System" \
        --m "Windows on this workspace toggled to floating/tiling"
