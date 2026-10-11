--  _   _                  _                 _
-- | | | |_   _ _ __  _ __| | __ _ _ __   __| |
-- | |_| | | | | '_ \| '__| |/ _` | '_ \ / _` |
-- |  _  | |_| | |_) | |  | | (_| | | | | (_| |
-- |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_|
--        |___/|_|
--
-- Lua config (Hyprland >= 0.55). Ported from the ML4W hyprland.conf.
-- Each module is loaded in its own scope, so an error in one doesn't stop the rest.
-- Docs: https://wiki.hypr.land/Configuring/Start/

require("lua.monitors")
require("lua.environment")
require("lua.settings")
require("lua.animations")
require("lua.autostart")
require("lua.rules")
require("lua.keybindings")
