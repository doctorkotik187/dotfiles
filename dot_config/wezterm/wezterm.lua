local wezterm = require("wezterm")
local config = wezterm.config_builder()

---- MOUSE ---------------------------------------------------

-- stop mouse clicks from auto-opening urls
config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = wezterm.action.CompleteSelection("ClipboardAndPrimarySelection"),
	},
}

---- WINDOW --------------------------------------------------

config.initial_cols = 120
config.initial_rows = 30

---- FONT ----------------------------------------------------

config.font = wezterm.font("Maple Mono NF CN", { weight = "Medium" })
config.font_size = 9

---- THEME & VISUALS -----------------------------------------

-- config.color_scheme = "Catppuccin Latte"     -- light
config.color_scheme = "Catppuccin Macchiato" -- dark

config.use_fancy_tab_bar = false -- minimal tab bar
config.hide_tab_bar_if_only_one_tab = true -- hide tab bar when only one tab

return config
