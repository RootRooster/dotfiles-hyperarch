-- -----------------------------------------------------
-- Input, look & feel, layouts, misc
-- (was keyboard.conf, windows/, decorations/, layouts/, misc.conf, ml4w.conf)
-- -----------------------------------------------------

local legacy = require("lua.legacy")
local c = legacy.colors() -- matugen palette from colors.conf

hl.config({
    input = {
        kb_layout          = "us",
        kb_variant         = "",
        kb_model           = "",
        kb_options         = "ctrl:nocaps",
        numlock_by_default = true,
        follow_mouse       = 1,
        mouse_refocus      = false,
        sensitivity        = 0, -- Pointer speed: -1.0 - 1.0, 0 means no modification.
        touchpad = {
            natural_scroll       = true,
            tap_to_click         = false,
            scroll_factor        = 1.0,
            disable_while_typing = true,
        },
    },

    general = {
        gaps_in          = 10,
        gaps_out         = 20,
        border_size      = 1,
        col = {
            active_border   = { colors = { c.primary or "rgba(cfbdfeff)", c.on_primary or "rgba(35275dff)" }, angle = 90 },
            inactive_border = c.on_primary or "rgba(35275dff)",
        },
        layout           = "dwindle",
        resize_on_border = true,
    },

    decoration = {
        rounding           = 10,
        active_opacity     = 1.0,
        inactive_opacity   = 0.9,
        fullscreen_opacity = 1.0,

        blur = {
            enabled           = true,
            size              = 4,
            passes            = 4,
            new_optimizations = true,
            ignore_opacity    = true,
            xray              = true,
        },

        shadow = {
            enabled      = true,
            range        = 32,
            render_power = 2,
            color        = "rgba(00000050)",
        },
    },

    dwindle = {
        preserve_split = true,
    },

    binds = {
        workspace_back_and_forth = false,
        allow_workspace_cycles   = true,
        pass_mouse_when_bound    = false,
    },

    misc = {
        disable_hyprland_logo      = true,
        disable_splash_rendering   = true,
        initial_workspace_tracking = 1,
        on_focus_under_fullscreen  = 1,
        allow_session_lock_restore = true,
    },

    xwayland = {
        force_zero_scaling = true,
    },
})
