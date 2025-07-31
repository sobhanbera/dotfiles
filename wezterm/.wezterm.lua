local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- font config
config.font = wezterm.font({
	family = "DankMono Nerd Font",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})
config.font_size = 16

-- window, tab related configs
config.enable_tab_bar = false
config.window_decorations = "RESIZE" -- NONE
config.window_background_opacity = 0.925
config.macos_window_background_blur = 50

-- config.color_scheme = "Catppuccin"
-- config.colors = {
-- 	foreground = "#c6d0f5",
-- 	background = "#1f2430",

-- 	cursor_bg = "#e5c890",
-- 	cursor_border = "#e5c890",
-- 	cursor_fg = "#011423",

-- 	selection_bg = "#313244",
-- 	selection_fg = "#c6d0f5",

-- 	ansi = { "#313244", "#e78284", "#a6d189", "#e5c890", "#8caaee", "#f4b8e4", "#85c1dc", "#c6d0f5" },
-- 	brights = { "#bcc0cc", "#d20f39", "#40a02b", "#fe640b", "#1e66f5", "#ea76cb", "#04a5e5", "#4c4f69" },
-- }

-- config.color_scheme = "Solarized"
-- config.colors = {
-- 	foreground = "#eee8d5",
-- 	background = "#002b36",

-- 	cursor_bg = "#fdf6e3",
-- 	cursor_border = "#fdf6e3",
-- 	cursor_fg = "#002b36",

-- 	selection_bg = "#073642",
-- 	selection_fg = "#fdf6e3",

-- 	ansi = { "#073642", "#dc322f", "#859900", "#b58900", "#268bd2", "#d33682", "#2aa198", "#eee8d5" },
-- 	brights = { "#bcc0cc", "#dc322f", "#859900", "#b58900", "#268bd2", "#d33682", "#2aa198", "#4c4f69" },
-- }

config.color_scheme = "Tokyodark"
config.colors = {
	foreground = "#A0A8CD",
	background = "#11121D",

	cursor_bg = "#A0A8CD",
	cursor_border = "#A0A8CD",
	cursor_fg = "#11121D",

	selection_bg = "#1A1B2A",
	selection_fg = "#A0A8CD",

	ansi = { "#212234", "#EE6D85", "#95C561", "#D7A65F", "#7199EE", "#A485DD", "#38A89D", "#A0A8CD" },
	brights = { "#A0A8CD", "#dc322f", "#859900", "#b58900", "#268bd2", "#d33682", "#2aa198", "#2A3A5A" },
}


-- config.color_scheme = "Ayu Mirage"
-- config.colors = {
-- 	foreground = "#cccac2",
-- 	background = "#1f2430",

-- 	cursor_bg = "#f2ae49",
-- 	cursor_border = "#f2ae49",
-- 	cursor_fg = "#1f2430",

-- 	selection_bg = "#69758c",
-- 	selection_fg = "#ffffff",

-- 	ansi = { "#313244", "#f28779", "#d5ff80", "#ffad66", "#73d0ff", "#dfbfff", "#5ccfe6", "#c6d0f5" },
-- 	brights = { "#bcc0cc", "#F07171", "#86b300", "#fa8d3e", "#399ee6", "#a37acc", "#55b4d4", "#4c4f69" },
-- }

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
