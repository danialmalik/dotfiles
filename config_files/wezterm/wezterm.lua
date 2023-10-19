-- Pull in the wezterm API
local wezterm = require 'wezterm'
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
  background = 'black',
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

------------------------ Event handlers --------------------------
wezterm.on('launch-1', function (window, pane1_1)
  local pane1_2 = pane1_1:split {
    direction = 'Bottom',
    size = 0.333
  }
  local pane1_3 = pane1_1:split {
    direction = 'Bottom',
    size = 0.5
  }

  pane1_1:split {
    direction = 'Right',
    size = 0.5
  }

  pane1_2:split {
    direction = 'Right',
    size = 0.5
  }

  pane1_3:split {
    direction = 'Right',
    size = 0.5
  }


end)

------------------------ Keybindings -----------------------------

config.leader  = {
  key = 'k',
  mods = 'CTRL',
  timeout_milliseconds = 3000
}

config.keys = {
  {
    key = 'p',
    mods = 'CTRL',
    action = act.ActivateCommandPalette
  },


  ------------- Switch Panes
  {
    key = 'LeftArrow',
    mods = 'LEADER|SHIFT',
    action = act.ActivatePaneDirection 'Left'
  },
  {
    key = 'RightArrow',
    mods = 'SHIFT',
    action = act.ActivatePaneDirection 'Right'
  },
  {
    key = 'UpArrow',
    mods = 'SHIFT',
    action = act.ActivatePaneDirection 'Up'
  },
  {
    key = 'DownArrow',
    mods = 'SHIFT',
    action = act.ActivatePaneDirection 'Down'
  },

  ------------- Pane size
  {
    key = 'LeftArrow',
    mods = 'ALT|SHIFT',
    action = act.AdjustPaneSize { 'Left', 2 },
  },
  {
    key = 'DownArrow',
    mods = 'ALT|SHIFT',
    action = act.AdjustPaneSize { 'Down', 1 },
  },
  { key = 'UpArrow', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Up', 1 } },
  {
    key = 'RightArrow',
    mods = 'ALT|SHIFT',
    action = act.AdjustPaneSize { 'Right', 2 },
  },

  -------------- Pane split
  {
    key = 'e',
    mods = 'CTRL|ALT',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  {
    key = 'd',
    mods = 'CTRL|ALT',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  {
    key = 'X',
    mods = 'CTRL|SHIFT',
    action = act.TogglePaneZoomState,
  },

  ----------- Custom Events
  {
    key = '1',
    mods = 'LEADER|CTRL',
    action = act.EmitEvent 'launch-1'
  }
}


-- and finally, return the configuration to wezterm
return config
