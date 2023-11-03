-- Pull in the wezterm API
local wezterm = require 'wezterm'
local event_handlers = require 'wezterm_event_handlers'

local act = wezterm.action

-- This table will hold the configuration.
local config = {}

------------------------- Initialize -----------------------------
-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

------------------------ Appearance ------------------------------
-- For example, changing the color scheme:
-- config.color_scheme = 'FirefoxDev'
-- config.color_scheme = 'Gnometerm (terminal.sexy)'
config.color_scheme = 'iTerm2 Tango Dark'

config.colors = {
    background = 'black'
}

-- config.window_background_image = '/path/to/wallpaper.jpg'

-- config.window_background_image_hsb = {
--   -- Darken the background image by reducing it to 1/3rd
--   brightness = 0.3,

--   -- You can adjust the hue by scaling its value.
--   -- a multiplier of 1.0 leaves the value unchanged.
--   hue = 1.0,

--   -- You can adjust the saturation also.
--   saturation = 1.0,
-- }

------------------------ Configs --------------------------------

------------------------ Keybindings -----------------------------

config.leader = {
    key = 'k',
    mods = 'CTRL',
    timeout_milliseconds = 3000
}

config.keys = {{
    key = 'p',
    mods = 'CTRL',
    action = act.ActivateCommandPalette
}, ------------- Switch Panes
{
    key = 'LeftArrow',
    mods = 'SHIFT',
    action = act.ActivatePaneDirection 'Left'
}, {
    key = 'RightArrow',
    mods = 'SHIFT',
    action = act.ActivatePaneDirection 'Right'
}, {
    key = 'UpArrow',
    mods = 'SHIFT',
    action = act.ActivatePaneDirection 'Up'
}, {
    key = 'DownArrow',
    mods = 'SHIFT',
    action = act.ActivatePaneDirection 'Down'
}, ------------- Pane size
{
    key = 'LeftArrow',
    mods = 'ALT|SHIFT',
    action = act.AdjustPaneSize {'Left', 2}
}, {
    key = 'DownArrow',
    mods = 'ALT|SHIFT',
    action = act.AdjustPaneSize {'Down', 1}
}, {
    key = 'UpArrow',
    mods = 'ALT|SHIFT',
    action = act.AdjustPaneSize {'Up', 1}
}, {
    key = 'RightArrow',
    mods = 'ALT|SHIFT',
    action = act.AdjustPaneSize {'Right', 2}
}, -------------- Pane split
{
    key = 'e',
    mods = 'CTRL|ALT',
    action = act.SplitHorizontal {
        domain = 'CurrentPaneDomain'
    }
}, {
    key = 'd',
    mods = 'CTRL|ALT',
    action = act.SplitVertical {
        domain = 'CurrentPaneDomain'
    }
}, {
    key = 'X',
    mods = 'CTRL|SHIFT',
    action = act.TogglePaneZoomState
}, ----------- Custom Events
{
    key = '1',
    mods = 'LEADER|CTRL',
    action = act.EmitEvent 'launch-tier3'
}, {
    key = '2',
    mods = 'LEADER|CTRL',
    action = act.EmitEvent 'launch-unhaggle'
}, {
    key = '3',
    mods = 'LEADER|CTRL',
    action = act.EmitEvent 'launch-asc'
}}

---------------------- Change tab switch key
for i = 1, 8 do
    -- CTRL + number to activate that tab
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'CTRL',
        action = act.ActivateTab(i - 1)
    })
    -- F1 through F8 to activate that tab
    table.insert(config.keys, {
        key = 'F' .. tostring(i),
        action = act.ActivateTab(i - 1)
    })
end

-- and finally, return the configuration to wezterm
return config
