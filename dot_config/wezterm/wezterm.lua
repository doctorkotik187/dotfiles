local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- font
config.font = wezterm.font 'BlexMono Nerd Font Medium'
config.font_size = 10

-- theme
config.color_scheme = 'Tokyo Night'

-- multiplexing
config.unix_domains = {{ name = 'unix' }}
config.default_gui_startup_args = { 'connect', 'unix' }

-- nushell
config.default_prog = { '/home/linuxbrew/.linuxbrew/bin/nu' }

-- distrobox
config.launch_menu = {{ label = 'archbox', args = { 'distrobox-enter', 'archbox', '--', 'nu' }}}

return config
