-- Tool: wezterm (https://wezterm.org) — GPU-accelerated terminal emulator and multiplexer

local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.default_cwd = wezterm.home_dir

-- Visuals ################################################
config.color_scheme = "Rosé Pine (Gogh)"
config.font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "DemiBold" })
config.font_size = 10
config.window_decorations = "RESIZE"

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
	{ key = "L", mods = "CTRL|SHIFT", action = wezterm.action.SendKey({ key = "l", mods = "CTRL" }) },
	{ key = "Enter", mods = "SHIFT", action = wezterm.action.SendKey({ key = "j", mods = "CTRL" }) },
	{ key = "v", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "s", mods = "ALT|SHIFT", action = wezterm.action.PaneSelect({ mode = "SwapWithActiveKeepFocus" }) },
}

-- Notifications ##########################################
config.audible_bell = "Disabled"
config.notification_handling = "SuppressFromFocusedTab"

return config
