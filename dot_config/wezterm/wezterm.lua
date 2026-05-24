local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- STOP CLICKING LINKS!
config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = wezterm.action.CompleteSelection 'ClipboardAndPrimarySelection',
  },
}

-- SIZE
config.initial_cols = 120
config.initial_rows = 30

-- FONT
config.font = wezterm.font('M PLUS 1 Code', { weight = 'Medium' })
config.font_size = 10

-- THEME & VISUALS
-- config.color_scheme = 'Catppuccin Latte'     -- light
config.color_scheme = 'Dracula (Official)'      -- dark

config.default_cursor_style = 'BlinkingBlock'
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

return config
