-- -----------------------------------------------------
-- Autostart (was autostart.conf, cursor.conf and exec-once lines)
-- -----------------------------------------------------

local legacy = require("lua.legacy")

hl.on("hyprland.start", function()
    -- Environment for xdg-desktop-portal-hyprland
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- Cursor: scripts/gtk.sh rewrites conf/cursor.conf, so run whatever it holds
    for _, p in ipairs(legacy.read_pairs(legacy.hypr_dir .. "/conf/cursor.conf")) do
        if p.key == "exec-once" or p.key == "exec" then
            hl.exec_cmd(p.value)
        end
    end

    -- Start Listeners
    hl.exec_cmd("~/.config/ml4w/listeners.sh --startall")

    -- Start Polkit
    hl.exec_cmd("systemctl --user start hyprpolkitagent")

    -- Keyring (Secret Service for application credentials)
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")

    -- Load Wallpaper
    hl.exec_cmd("~/.config/hypr/scripts/wallpaper-restore.sh")

    -- Load Notification Daemon
    hl.exec_cmd("swaync")

    -- Load GTK settings
    hl.exec_cmd("~/.config/hypr/scripts/gtk.sh")

    -- Using hypridle to start hyprlock
    hl.exec_cmd("hypridle")

    -- Load cliphist history
    hl.exec_cmd("wl-paste --watch cliphist store")

    -- Start autostart cleanup
    hl.exec_cmd("~/.config/hypr/scripts/cleanup.sh")
end)
