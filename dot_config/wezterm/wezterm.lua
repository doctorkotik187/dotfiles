local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- fix window buttons
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- font
config.font = wezterm.font 'BlexMono Nerd Font Medium'
config.font_size = 10

-- theme
config.color_scheme = 'Tokyo Night'

-- multiplexing
config.unix_domains = {{ name = 'unix' }}
config.default_gui_startup_args = { 'connect', 'unix' }

return config
