-- Tool: wezterm (https://wezterm.org) — GPU-accelerated terminal emulator and multiplexer

local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Mouse ##################################################
config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = wezterm.action.CompleteSelection("ClipboardAndPrimarySelection"),
	},
}

-- Keybinds ###############################################
config.keys = {
	{ key = "UpArrow", mods = "ALT", action = wezterm.action.SendKey({ key = "PageUp" }) },
	{ key = "DownArrow", mods = "ALT", action = wezterm.action.SendKey({ key = "PageDown" }) },
	-- disable wezterm's debug screen
	{ key = "L", mods = "CTRL|SHIFT", action = wezterm.action.SendKey({ key = "l", mods = "CTRL" }) },
	-- shift-enter -> ctrl+j for omp etc.
	{ key = "Enter", mods = "SHIFT", action = wezterm.action.SendKey({ key = "j", mods = "CTRL" }) },
}

-- Visuals ################################################
config.font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Medium" })
config.font_size = 10
config.color_scheme = "Rosé Pine (Gogh)"
config.audible_bell = "Disabled"
config.window_decorations = "RESIZE"

return config
