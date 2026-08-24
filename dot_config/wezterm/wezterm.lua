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

---- KEYBINDS ------------------------------------------------

-- mostly for herdr
config.keys = {
	{ key = "UpArrow", mods = "ALT|SHIFT", action = wezterm.action.SendKey({ key = "PageUp" }) },
	{ key = "DownArrow", mods = "ALT|SHIFT", action = wezterm.action.SendKey({ key = "PageDown" }) },
}

---- WINDOW --------------------------------------------------

config.initial_cols = 120
config.initial_rows = 30

---- FONT ----------------------------------------------------

config.font = wezterm.font("Maple Mono NF CN", { weight = "Medium" })
config.font_size = 9

---- THEME & VISUALS -----------------------------------------

-- config.color_scheme = "Catppuccin Latte"
config.color_scheme = "Catppuccin Macchiato"

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

return config
