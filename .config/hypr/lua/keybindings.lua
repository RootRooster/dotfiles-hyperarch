-- -----------------------------------------------------
-- Key bindings (was keybindings/default.conf + custom.conf)
-- Descriptions are read by scripts/keybindings.sh via `hyprctl binds -j`.
-- -----------------------------------------------------

local mainMod     = "SUPER"
local HYPRSCRIPTS = "~/.config/hypr/scripts"
local SCRIPTS     = "~/.config/ml4w/scripts"

local exec = hl.dsp.exec_cmd

local function bind(keys, action, desc, opts)
    opts = opts or {}
    opts.description = desc
    return hl.bind(keys, action, opts)
end

local function M(keys) -- "SHIFT + E" -> "SUPER + SHIFT + E"
    return mainMod .. " + " .. keys
end

-- Applications
bind(M("T"),          exec("~/.config/ml4w/settings/terminal.sh"),         "Open the terminal")
bind(M("B"),          exec("~/.config/ml4w/settings/browser.sh"),          "Open the browser")
bind(M("E"),          exec("~/.config/ml4w/settings/filemanager.sh"),      "Open the filemanager")
bind(M("SHIFT + E"),  exec("kitty --class dotfiles-floating -e yazi"),     "Open yazi (terminal file manager)")
bind(M("CTRL + E"),   exec("~/.config/ml4w/settings/emojipicker.sh"),      "Open the emoji picker")
bind(M("CTRL + C"),   exec("~/.config/ml4w/settings/calculator.sh"),       "Open the calculator")

-- Display zoom
local function zoom_by(delta)
    return function()
        local z = hl.get_config("cursor.zoom_factor") or 1
        hl.config({ cursor = { zoom_factor = math.max(1, z + delta) } })
    end
end
bind(M("SHIFT + mouse_down"), zoom_by(0.5),  "Increase display zoom")
bind(M("SHIFT + mouse_up"),   zoom_by(-0.5), "Decrease display zoom")
bind(M("SHIFT + Z"), function() hl.config({ cursor = { zoom_factor = 1 } }) end, "Reset display zoom")

-- Windows
bind(M("Q"),         hl.dsp.window.close(),                                "Kill active window")
bind(M("SHIFT + Q"), exec("hyprctl activewindow | grep pid | tr -d 'pid:' | xargs kill"), "Quit active window and all open instances")
bind(M("M"),         hl.dsp.window.fullscreen({ mode = "maximized" }),     "Maximize window")
bind(M("F"),         hl.dsp.window.fullscreen({ mode = "fullscreen" }),    "Fullscreen window (covers the bar)")
bind(M("SHIFT + F"), hl.dsp.window.float({ action = "toggle" }),           "Toggle active window into floating mode")

-- Toggle all windows on the workspace between floating and tiling
local function toggle_all_float()
    local wins = hl.get_workspace_windows(hl.get_active_workspace())
    local any_tiled = false
    for _, w in ipairs(wins) do
        if not w.floating then any_tiled = true end
    end
    for _, w in ipairs(wins) do
        hl.dispatch(hl.dsp.window.float({ window = "address:" .. w.address, action = any_tiled and "enable" or "disable" }))
    end
end
bind(M("SHIFT + T"), toggle_all_float, "Toggle all windows into floating mode")

-- Window focus
bind(M("L"), hl.dsp.focus({ direction = "right" }), "Move focus right")
bind(M("H"), hl.dsp.focus({ direction = "left" }),  "Move focus left")
bind(M("K"), hl.dsp.focus({ direction = "up" }),    "Move focus up")
bind(M("J"), hl.dsp.focus({ direction = "down" }),  "Move focus down")

-- Monitor focus
bind(M("period"), hl.dsp.focus({ monitor = "+1" }), "Focus next monitor")
bind(M("comma"),  hl.dsp.focus({ monitor = "-1" }), "Focus previous monitor")

-- Move window to monitor
bind(M("SHIFT + period"), hl.dsp.window.move({ monitor = "+1" }), "Move active window to next monitor")
bind(M("SHIFT + comma"),  hl.dsp.window.move({ monitor = "-1" }), "Move active window to previous monitor")

-- Move workspace to monitor
bind(M("CTRL + period"), hl.dsp.workspace.move({ monitor = "+1" }), "Move workspace to next monitor")
bind(M("CTRL + comma"),  hl.dsp.workspace.move({ monitor = "-1" }), "Move workspace to previous monitor")

-- Window size
bind(M("ALT + L"), hl.dsp.window.resize({ x = 100,  y = 0,    relative = true }), "Increase window width")
bind(M("ALT + H"), hl.dsp.window.resize({ x = -100, y = 0,    relative = true }), "Reduce window width")
bind(M("ALT + K"), hl.dsp.window.resize({ x = 0,    y = -100, relative = true }), "Reduce window height")
bind(M("ALT + J"), hl.dsp.window.resize({ x = 0,    y = 100,  relative = true }), "Increase window height")

-- Swap tiled windows
bind(M("SHIFT + L"), hl.dsp.window.swap({ direction = "right" }), "Swap tiled window right")
bind(M("SHIFT + H"), hl.dsp.window.swap({ direction = "left" }),  "Swap tiled window left")
bind(M("SHIFT + K"), hl.dsp.window.swap({ direction = "up" }),    "Swap tiled window up")
bind(M("SHIFT + J"), hl.dsp.window.swap({ direction = "down" }),  "Swap tiled window down")

-- Mouse
bind(M("mouse:272"), hl.dsp.window.drag(),   "Move window with the mouse",   { mouse = true })
bind(M("mouse:273"), hl.dsp.window.resize(), "Resize window with the mouse", { mouse = true })
bind(M("G"), hl.dsp.group.toggle(), "Toggle window group")
bind("ALT + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.bring_to_top())
end, "Cycle between windows", { repeating = true })

-- Actions
bind(M("CTRL + R"),  exec("hyprctl reload"),                                "Reload Hyprland configuration")
bind(M("SHIFT + A"), exec(HYPRSCRIPTS .. "/toggle-animations.sh"),          "Toggle animations")
bind(M("PRINT"),     exec(HYPRSCRIPTS .. "/cyber-shot.sh"),                 "Screenshot menu")
bind("CTRL + SHIFT + code:13", exec(HYPRSCRIPTS .. "/cyber-shot.sh"),       "Screenshot menu") -- key position of 4, layout independent
bind(M("ALT + F"),   exec(HYPRSCRIPTS .. "/screenshot.sh --instant"),       "Take an instant full-screen screenshot")
bind(M("ALT + S"),   exec(HYPRSCRIPTS .. "/screenshot.sh --instant-area"),  "Take an instant area screenshot")
bind(M("ALT + A"),   exec(HYPRSCRIPTS .. "/text-extractor.sh"),             "Extract text from an area")
bind(M("CTRL + Q"),  exec("~/.config/ml4w/scripts/ml4w-wlogout"),           "Start wlogout")
bind(M("SHIFT + W"), exec(HYPRSCRIPTS .. "/waypaper.sh --random"),          "Change the wallpaper")
bind(M("CTRL + W"),  exec(HYPRSCRIPTS .. "/waypaper.sh"),                   "Open wallpaper selector")
bind(M("ALT + W"),   exec(HYPRSCRIPTS .. "/wallpaper-automation.sh"),       "Start random wallpaper script")
bind(M("CTRL + K"),  exec(HYPRSCRIPTS .. "/keybindings.sh"),                "Show keybindings")
bind(M("SHIFT + B"), exec("~/.config/waybar/launch.sh"),                    "Reload waybar")
bind(M("CTRL + B"),  exec("~/.config/waybar/toggle.sh"),                    "Toggle waybar")
bind(M("SHIFT + R"), exec(HYPRSCRIPTS .. "/loadconfig.sh"),                 "Reload Hyprland configuration")
bind(M("SPACE"),     exec(HYPRSCRIPTS .. "/launcher.sh"),                   "Open application launcher")
bind(M("V"),         exec(SCRIPTS .. "/ml4w-cliphist"),                     "Open clipboard manager")
bind(M("CTRL + T"),  exec("~/.config/waybar/themeswitcher.sh"),             "Open waybar theme switcher")
bind(M("ALT + G"),   exec(HYPRSCRIPTS .. "/gamemode.sh"),                   "Toggle game mode")
bind(M("CTRL + L"),  exec(HYPRSCRIPTS .. "/power.sh lock"),                 "Lock screen")
bind("CTRL + Tab",   exec(HYPRSCRIPTS .. "/focus.sh"),                      "Open select window menu")

-- Scratchpad (native special workspace)
bind(M("S"),         hl.dsp.workspace.toggle_special("scratchpad"),                         "Toggle scratchpad terminal")
bind(M("SHIFT + S"), hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }), "Send focused window to scratchpad")

-- Workspaces
for i = 1, 10 do
    local key = tostring(i % 10) -- 10 is on the 0 key
    bind(M(key),            hl.dsp.focus({ workspace = i }),                      "Open workspace " .. i)
    bind(M("SHIFT + " .. key), hl.dsp.window.move({ workspace = i, follow = true }), "Move active window to workspace " .. i)
    bind(M("CTRL + " .. key),  exec(HYPRSCRIPTS .. "/moveTo.sh " .. i),            "Move all windows to workspace " .. i)
end

bind(M("Tab"),         hl.dsp.focus({ workspace = "m+1" }),   "Open next workspace")
bind(M("SHIFT + Tab"), hl.dsp.focus({ workspace = "m-1" }),   "Open previous workspace")
bind(M("mouse_down"),  hl.dsp.focus({ workspace = "e+1" }),   "Open next workspace")
bind(M("mouse_up"),    hl.dsp.focus({ workspace = "e-1" }),   "Open previous workspace")
bind(M("CTRL + down"), hl.dsp.focus({ workspace = "empty" }), "Open the next empty workspace")

-- Fn keys
bind("XF86MonBrightnessUp",   exec("brightnessctl -q s +10%"), "Increase brightness by 10%")
bind("XF86MonBrightnessDown", exec("brightnessctl -q s 10%-"), "Reduce brightness by 10%")
bind("XF86AudioRaiseVolume",  exec("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), "Increase volume by 5%", { locked = true, repeating = true })
bind("XF86AudioLowerVolume",  exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      "Reduce volume by 5%",   { locked = true, repeating = true })
bind("XF86AudioMute",         exec("pactl set-sink-mute @DEFAULT_SINK@ toggle"),      "Toggle mute")
bind("XF86AudioPlay",         exec("playerctl play-pause"), "Audio play pause")
bind("XF86AudioPause",        exec("playerctl pause"),      "Audio pause")
bind("XF86AudioNext",         exec("playerctl next"),       "Audio next")
bind("XF86AudioPrev",         exec("playerctl previous"),   "Audio previous")
bind("XF86AudioMicMute",      exec("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), "Toggle microphone")
bind("XF86Calculator",        exec("~/.config/ml4w/settings/calculator.sh"),         "Open calculator")

bind("code:238", exec("brightnessctl -d smc::kbd_backlight s +10"), "Keyboard backlight up")
bind("code:237", exec("brightnessctl -d smc::kbd_backlight s 10-"), "Keyboard backlight down")
