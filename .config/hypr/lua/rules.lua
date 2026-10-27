-- -----------------------------------------------------
-- Window, layer and workspace rules
-- (was cyber.conf, custom.conf, workspaces/default.conf)
-- -----------------------------------------------------

-- Floating, centered window: float_center(name, class, {w, h}, pin?)
local function float_center(name, class, size, pin)
    hl.window_rule({
        name   = name,
        match  = { class = class },
        float  = true,
        center = true,
        pin    = pin or nil,
        size   = size,
    })
end

-- SwayNC
for _, ns in ipairs({ "swaync-control-center", "swaync-notification-window" }) do
    hl.layer_rule({ match = { namespace = ns }, blur = true, ignore_alpha = 0.5 })
end

-- Cyber / general apps
float_center("pavucontrol",           [[(.*org.pulseaudio.pavucontrol.*)]], { 700, 600 },  true)
float_center("waypaper",              [[(.*waypaper.*)]],                   { 900, 700 },  true)
float_center("newelle",               [[(io.github.qwersyk.Newelle)]],      { 1000, 700 }, true)
float_center("blueman-manager",       [[(blueman-manager)]],                { 800, 600 })
float_center("nwg-look",              [[(nwg-look)]],                       { 700, 600 })
float_center("nwg-displays",          [[(nwg-displays)]],                   { 900, 600 })
float_center("missioncenter",         [[(io.missioncenter.MissionCenter)]], { 900, 600 },  true)
float_center("gnome-calculator",      [[(org.gnome.Calculator)]],           { 700, 600 })
float_center("hyprland-share-picker", [[(hyprland-share-picker)]],          { 600, 400 },  true)
float_center("nm-connection-editor",  [[(nm-connection-editor)]],           { 800, 700 })
float_center("dotfiles-floating",     [[(dotfiles-floating)]],              { 1000, 700 })

-- Picture-in-Picture
hl.window_rule({
    name   = "Picture-in-Picture",
    match  = { title = [[^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$]] },
    float  = true,
    pin    = true,
    center = true,
})

-- Scratchpad terminal (centered drop-down shown via the special workspace)
float_center("scratchpad", [[(scratchpad)]], { 1200, 780 })

-- Cyber popups (custom.conf)
float_center("cyber-sound",     [[(com.saivert.pwvucontrol)]], { 920, 560 })  -- pwvucontrol, waybar volume
float_center("cyber-network",   [[(org.nmrs.ui)]],             { 760, 560 })  -- nmrs, waybar network
float_center("cyber-bluetooth", [[(cyber-bluetooth)]],         { 1000, 620 }) -- bluetui, waybar bluetooth
float_center("cyber-ai",        [[(cyber-ai)]],                { 900, 560 })  -- rofi AI tab answer window
float_center("cyber-calc",      [[(cyber-calc)]],              { 760, 460 })  -- qalc, Super+Ctrl+C

-- Workspaces: laptop (eDP-1) gets 1-5, external (DP-3) gets 6-10
for i = 1, 5 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "eDP-1" })
end
for i = 6, 10 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "DP-3" })
end

-- Scratchpad terminal: auto-spawn kitty the first time the special workspace opens
hl.workspace_rule({ workspace = "special:scratchpad", on_created_empty = "kitty --class scratchpad" })
