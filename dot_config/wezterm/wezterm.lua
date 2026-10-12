-- Tool: wezterm (https://wezfurlong.org/wezterm/) — GPU-accelerated terminal emulator and multiplexer

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
	-- shift-enter -> ctrl+j for herdr
	{ key = "Enter", mods = "SHIFT", action = wezterm.action.SendKey({ key = "j", mods = "CTRL" }) },
}

-- Font ###################################################
config.font = wezterm.font("JetBrainsMono NF", { weight = "Medium" })
config.font_size = 9

-- Visuals ################################################
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.audible_bell = "Disabled"
config.window_decorations = "RESIZE"

local function make_tab_bar(accent)
	return {
		background = "#191724",
		active_tab = { bg_color = accent, fg_color = "#000000", intensity = "Bold" },
		inactive_tab = { bg_color = "#2a273f", fg_color = "#908caa" },
		inactive_tab_hover = { bg_color = "#393552", fg_color = "#e0def4" },
		new_tab = { bg_color = "#232136", fg_color = "#908caa" },
		new_tab_hover = { bg_color = "#393552", fg_color = "#e0def4" },
	}
end

config.colors = { tab_bar = make_tab_bar("#00F0FF") }

-- Default to rose-pine; switch to moon inside smolbaby sandbox
wezterm.on("update-status", function(window, pane)
	local is_smol = pane:get_title():find("smolbaby") ~= nil
	local target = is_smol and "rose-pine-moon" or "rose-pine"
	local accent = is_smol and "#FF007F" or "#00F0FF"

	local current = window:get_config_overrides() or {}
	if current.color_scheme ~= target then
		current.color_scheme = target
		current.colors = {
			cursor_bg = accent,
			cursor_border = accent,
			tab_bar = make_tab_bar(accent),
		}
		window:set_config_overrides(current)
	end
end)

return config
