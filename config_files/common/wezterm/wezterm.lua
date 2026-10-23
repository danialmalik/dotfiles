-- Pull in the wezterm API
local wezterm = require 'wezterm'

local event_handlers = require 'wezterm_event_handlers'

local act = wezterm.action

-- Check OS if it's macOS
local is_mac = wezterm.target_triple:find 'apple' ~= nil

-- If on mac, set META to CMD
local meta_key = is_mac and 'CMD' or 'CTRL'

-- This table will hold the configuration.
local config = {}

local function mergeTablesIntoNew(table1, table2)
  local newTable = {}
  for _, value in ipairs(table1) do
    newTable[#newTable + 1] = value
  end
  for _, value in ipairs(table2) do
    newTable[#newTable + 1] = value
  end
  return newTable
end

------------------------- Initialize -----------------------------
-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then config = wezterm.config_builder() end

------------------------ Appearance ------------------------------
config.enable_scroll_bar = true
config.window_decorations = "NONE"
config.font = wezterm.font('Fira Code')
config.font_size = 18.0
config.harfbuzz_features = { 'liga=1' }

config.window_background_opacity = 0.9
config.macos_window_background_blur = 30

config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"


---cycle through builtin dark schemes in dark mode,
---and through light schemes in light mode.
---This only previews a scheme via a per-window override; it never touches
---the file. Any config reload (e.g. saving the file) clears the preview so
---config.color_scheme always wins -- see the window-config-reloaded handler below.
local suppress_override_clear = false

local function themeCycler(window, _)
	local allSchemes = wezterm.color.get_builtin_schemes()
	local currentMode = wezterm.gui.get_appearance()
	local currentScheme = window:effective_config().color_scheme
	local darkSchemes = {}
	local lightSchemes = {}

	for name, scheme in pairs(allSchemes) do
		if scheme.background then
			local bg = wezterm.color.parse(scheme.background) -- parse into a color object
			---@diagnostic disable-next-line: unused-local
			local h, s, l, a = bg:hsla() -- and extract HSLA information
			if l < 0.4 then
				table.insert(darkSchemes, name)
			else
				table.insert(lightSchemes, name)
			end
		end
	end
	local schemesToSearch = currentMode:find("Dark") and darkSchemes or lightSchemes

	-- default to the first scheme in the bucket if currentScheme isn't in it
	-- (e.g. it belongs to the other light/dark bucket), so this never silently no-ops
	local nextIndex = 1
	for i = 1, #schemesToSearch do
		if schemesToSearch[i] == currentScheme then
			nextIndex = (i % #schemesToSearch) + 1
			break
		end
	end

	local nextScheme = schemesToSearch[nextIndex]
	local overrides = window:get_config_overrides() or {}
	overrides.color_scheme = nextScheme
	wezterm.log_info("Previewing: " .. nextScheme)
	suppress_override_clear = true
	window:set_config_overrides(overrides)
end

-- set_config_overrides() itself fires window-config-reloaded, so a flag is
-- needed to tell "we just set the preview" apart from "the file reloaded" --
-- otherwise this would immediately clear the preview we just set.
wezterm.on('window-config-reloaded', function(window, _)
	if suppress_override_clear then
		suppress_override_clear = false
		return
	end
	local overrides = window:get_config_overrides()
	if overrides and overrides.color_scheme then
		overrides.color_scheme = nil
		suppress_override_clear = true
		window:set_config_overrides(overrides)
	end
end)

-- For example, changing the color scheme:
-- Later This Evening
-- config.color_scheme = 'Builtin Dark'
-- config.color_scheme = 'IrBlack (Gogh)'
config.color_scheme = 'Mikazuki (terminal.sexy)'
-- config.color_scheme = 'ibm3270 (Gogh)'
-- config.color_scheme = 'rose-pine-moon'

-- config.color_scheme = 'Gnometerm (terminal.sexy)'



-- if config.color_scheme == 'rose-pine-moon' then
--   local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').main
--   config.colors = theme.colors()
--   window_frame = theme.window_frame()
-- end

-- config.window_background_image = '/home/danialmalik/MEGAsync/imgs/1139110.jpg'

config.window_background_image_hsb = {
  -- Darken the background image by reducing it to 1/3rd
  brightness = 0.1,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  hue = 1.0,

  -- You can adjust the saturation also.
  saturation = 0.4,
}

------------------------ Configs --------------------------------
config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400 -- 1 day

------------------------ Keybindings -----------------------------

config.leader = {key = 'k', mods = 'ALT', timeout_milliseconds = 3000}
local keys_bindings

if is_mac then
    keys_bindings = {
        ------------- Basic navigation
        -- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
        {
            key = 'LeftArrow',
            mods = 'OPT',
            action = act.SendKey {
                key = 'b',
                mods = 'ALT',
            },
        },
        {
            key = 'RightArrow',
            mods = 'OPT',
            action = act.SendKey { key = 'f', mods = 'ALT' },
        },

        -- Cmd+Backspace to delete whole command
        {
            key = 'Backspace',
            mods = 'CMD',
            action = act.SendKey { mods = 'CTRL', key = 'u' },
        },

        -------------- Pane split
        {
            key = 'd',
            mods = meta_key,
            action = act.SplitHorizontal {domain = 'CurrentPaneDomain'}
        },
        {
            key = 'd',
            mods = meta_key .. '|SHIFT',
            action = act.SplitVertical {domain = 'CurrentPaneDomain'}
        },
        ------------- Switch Panes
        {
            key = 'LeftArrow',
            mods = meta_key .. '|ALT',
            action = act.ActivatePaneDirection 'Left'
        }, {
            key = 'RightArrow',
            mods = meta_key .. '|ALT',
            action = act.ActivatePaneDirection 'Right'
        },
        {key = 'UpArrow', mods = meta_key .. '|ALT', action = act.ActivatePaneDirection 'Up'},
        {
            key = 'DownArrow',
            mods = meta_key .. '|ALT',
            action = act.ActivatePaneDirection 'Down'
        },
        {key = 'x', mods = meta_key .. '|SHIFT', action = act.TogglePaneZoomState},
        -------------- pane size
        {
            key = 'LeftArrow',
            mods = 'ALT|SHIFT',
            action = act.AdjustPaneSize {'Left', 2}
        }, {
            key = 'DownArrow',
            mods = 'ALT|SHIFT',
            action = act.AdjustPaneSize {'Down', 1}
        },
        {key = 'UpArrow', mods = 'ALT|SHIFT', action = act.AdjustPaneSize {'Up', 1}},
        {
            key = 'RightArrow',
            mods = 'ALT|SHIFT',
            action = act.AdjustPaneSize {'Right', 2}
        },

    }
else -- Linux OS
    keys_bindings = {
        ------------- Disabled
        -- {
        --     key = 'LeftArrow',
        --     mods = 'ALT',
        --     action = act.DisableDefaultAssignment
        -- },

        ------------- Switch Panes
        {
            key = 'LeftArrow',
            mods = 'SHIFT',
            action = act.ActivatePaneDirection 'Left'
        }, {
            key = 'RightArrow',
            mods = 'SHIFT',
            action = act.ActivatePaneDirection 'Right'
        },
        {key = 'UpArrow', mods = 'SHIFT', action = act.ActivatePaneDirection 'Up'},
        {
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
        },
        {key = 'UpArrow', mods = 'ALT|SHIFT', action = act.AdjustPaneSize {'Up', 1}},
        {
            key = 'RightArrow',
            mods = 'ALT|SHIFT',
            action = act.AdjustPaneSize {'Right', 2}
        },
        -------------- Pane split
        {
            key = 'e',
            mods = 'CTRL|ALT',
            action = act.SplitHorizontal {domain = 'CurrentPaneDomain'}
        }, {
            key = 'd',
            mods = 'CTRL|ALT',
            action = act.SplitVertical {domain = 'CurrentPaneDomain'}
        }, {key = 'X', mods = 'CTRL|SHIFT', action = act.TogglePaneZoomState},
    }
end

local common_bindings = {
    {key = 'p', mods = meta_key, action = act.ActivateCommandPalette},
    { key = "Escape", mods = "CTRL", action = wezterm.action.ShowDebugOverlay },

    ------------- Appearance related
    { key = "t", mods = "ALT", action = wezterm.action_callback(themeCycler) },



    --- CustomEventHandlers
    {key = 'd', mods = 'LEADER', action = act.EmitEvent 'launch-dotfiles'}
}

config.keys = mergeTablesIntoNew(keys_bindings, common_bindings)


---------------------- Change tab switch key
for i = 1, 8 do
    -- CTRL + number to activate that tab
    table.insert(config.keys, {
        key = tostring(i),
        mods = meta_key,
        action = act.ActivateTab(i - 1)
    })
    -- F1 through F8 to activate that tab
    table.insert(config.keys,
                 {key = 'F' .. tostring(i), action = act.ActivateTab(i - 1)})
end

-- and finally, return the configuration to wezterm
return config
