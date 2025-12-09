local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- stop clicking links!
config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = wezterm.action.CompleteSelection 'ClipboardAndPrimarySelection',
  },
}

-- size
config.initial_cols = 120
config.initial_rows = 30

-- font
config.font = wezterm.font 'BlexMono Nerd Font Medium'
config.font_size = 10

-- theme
config.color_scheme = 'Tokyo Night'

return config
