local wezterm = require 'wezterm'
local mux = wezterm.mux
local config = wezterm.config_builder()

-- maximized windows
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- font
config.font = wezterm.font 'BlexMono Nerd Font'
config.font_size = 10

-- theme
config.color_scheme = 'Tokyo Night'

return config
