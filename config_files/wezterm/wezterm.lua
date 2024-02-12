-- Pull in the wezterm API
local wezterm = require 'wezterm'
local event_handlers = require 'wezterm_event_handlers'

local act = wezterm.action

-- This table will hold the configuration.
local config = {}

------------------------- Initialize -----------------------------
-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then config = wezterm.config_builder() end

------------------------ Appearance ------------------------------
config.enable_scroll_bar = true
config.window_decorations = "NONE"
config.font = wezterm.font('Fira Code')
config.harfbuzz_features = { 'liga=1' }

---cycle through builtin dark schemes in dark mode,
---and through light schemes in light mode
local function themeCycler(window, _)
    local allSchemes = wezterm.color.get_builtin_schemes()
    local currentMode = wezterm.gui.get_appearance()
    local currentScheme = window:effective_config().color_scheme
    local darkSchemes = {}
    local lightSchemes = {}

    for name, scheme in pairs(allSchemes) do
        local bg = wezterm.color.parse(scheme.background) -- parse into a color object
        ---@diagnostic disable-next-line: unused-local
        local h, s, l, a = bg:hsla() -- and extract HSLA information
        if l < 0.4 then
            table.insert(darkSchemes, name)
        else
            table.insert(lightSchemes, name)
        end
    end
    local schemesToSearch = currentMode:find("Dark") and darkSchemes or lightSchemes

    for i = 1, #schemesToSearch, 1 do
        if schemesToSearch[i] == currentScheme then
            local overrides = window:get_config_overrides() or {}
            overrides.color_scheme = schemesToSearch[i + 1]
            wezterm.log_info("Switched to: " .. schemesToSearch[i + 1])
            window:set_config_overrides(overrides)
            return
        end
    end
end

-- For example, changing the color scheme:
-- Later This Evening
config.color_scheme = 'Builtin Dark'
config.color_scheme = 'Kolorit'
config.color_scheme = 'Galaxy'
config.color_scheme = 'Gnometerm (terminal.sexy)'


-- config.colors = {background = '#000000'}

config.window_background_image = '/home/danialmalik/MEGAsync/imgs/1139110.jpg'

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

config.leader = {key = 'k', mods = 'CTRL', timeout_milliseconds = 3000}

config.keys = {

    {key = 'p', mods = 'CTRL', action = act.ActivateCommandPalette},

    ------------- Disabled
    {
        key = 'f1',
        mods = '',
        action = act.DisableDefaultAssignment
    },
    ------------- Appearance related
    { key = "t", mods = "ALT", action = wezterm.action_callback(themeCycler) },

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
    }, -------------- Pane split
    {
        key = 'e',
        mods = 'CTRL|ALT',
        action = act.SplitHorizontal {domain = 'CurrentPaneDomain'}
    }, {
        key = 'd',
        mods = 'CTRL|ALT',
        action = act.SplitVertical {domain = 'CurrentPaneDomain'}
    }, {key = 'X', mods = 'CTRL|SHIFT', action = act.TogglePaneZoomState},
    ----------- Custom Events
    {key = '1', mods = 'LEADER|CTRL', action = act.EmitEvent 'launch-tier3'},
    {key = '2', mods = 'LEADER|CTRL', action = act.EmitEvent 'launch-unhaggle'},

    {key = '3', mods = 'LEADER|CTRL', action = act.EmitEvent 'launch-asc'},
    {key = '4', mods = 'LEADER|CTRL', action = act.EmitEvent 'launch-asl'},
    {key = '5', mods = 'LEADER|CTRL', action = act.EmitEvent 'launch-as-core-utils'},

    {key = '6', mods = 'LEADER|CTRL', action = act.EmitEvent 'launch-atx-crm'}
}

---------------------- Change tab switch key
for i = 1, 8 do
    -- CTRL + number to activate that tab
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'CTRL',
        action = act.ActivateTab(i - 1)
    })
    -- F1 through F8 to activate that tab
    table.insert(config.keys,
                 {key = 'F' .. tostring(i), action = act.ActivateTab(i - 1)})
end

-- and finally, return the configuration to wezterm
return config
