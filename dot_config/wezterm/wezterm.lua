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
config.font = wezterm.font 'Source Han Code JP M'
config.font_size = 9.5

-- theme
-- config.color_scheme = 'Catppuccin Latte'     -- light
config.color_scheme = 'Catppuccin Macchiato' -- dark

config.use_fancy_tab_bar = false

return config
