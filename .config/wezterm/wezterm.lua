-- Tool: wezterm (https://wezterm.org) — GPU-accelerated terminal emulator and multiplexer

local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Visuals ################################################
config.color_scheme = "Rosé Pine (Gogh)"
config.font = wezterm.font("GeistMono Nerd Font Mono", { weight = "Medium" })
config.font_size = 10
config.window_decorations = "RESIZE"
config.enable_scroll_bar = true
config.audible_bell = "Disabled"
config.colors = {
	scrollbar_thumb = "#ebbcba", -- Rosé Pine Rose
}

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
	-- Navigation & Editing -----------------------------------
	{ key = "UpArrow", mods = "ALT", action = wezterm.action.SendKey({ key = "PageUp" }) },
	{ key = "DownArrow", mods = "ALT", action = wezterm.action.SendKey({ key = "PageDown" }) },
	{ key = "L", mods = "CTRL|SHIFT", action = wezterm.action.SendKey({ key = "l", mods = "CTRL" }) },
	{ key = "Enter", mods = "SHIFT", action = wezterm.action.SendKey({ key = "j", mods = "CTRL" }) },
	{ key = "v", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },

	-- Panes --------------------------------------------------
	{ key = "d", mods = "ALT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "n", mods = "ALT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "d", mods = "ALT|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "n", mods = "ALT|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "w", mods = "ALT", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	{ key = "m", mods = "ALT", action = wezterm.action.TogglePaneZoomState },
	{ key = "s", mods = "ALT|SHIFT", action = wezterm.action.PaneSelect({ mode = "SwapWithActiveKeepFocus" }) },

	-- Tabs ---------------------------------------------------
	{ key = "t", mods = "ALT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "ALT|SHIFT", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
	{ key = "[", mods = "ALT", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "]", mods = "ALT", action = wezterm.action.ActivateTabRelative(1) },
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

return config
