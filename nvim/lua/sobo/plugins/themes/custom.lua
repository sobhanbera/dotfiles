local colors = require("sobo.plugins.diagnostics.message").colors

local M = {}

local colorss = {
	blue = "#65D1FF",
	green = "#3EFFDC",
	violet = "#FF61EF",
	yellow = "#FFDA7B",
	red = "#FF4A4A",
	fg = "#c3ccdc",
	bg = "#112638",
	inactive_bg = "#2c3043",
}

local custom_lualine_theme = {
	normal = {
		a = { bg = colors.blue, fg = colors.fg, gui = "bold" },
		b = { bg = colors.bg, fg = colors.fg },
		c = { bg = colors.bg, fg = colors.fg },
	},
	insert = {
		a = { bg = colors.green, fg = colors.fg, gui = "bold" },
		b = { bg = colors.bg, fg = colors.fg },
		c = { bg = colors.bg, fg = colors.fg },
	},
	visual = {
		a = { bg = colors.purple, fg = colors.fg, gui = "bold" },
		b = { bg = colors.bg, fg = colors.fg },
		c = { bg = colors.bg, fg = colors.fg },
	},
	command = {
		a = { bg = colors.yellow, fg = colors.fg, gui = "bold" },
		b = { bg = colors.bg, fg = colors.fg },
		c = { bg = colors.bg, fg = colors.fg },
	},
	replace = {
		a = { bg = colors.red, fg = colors.fg, gui = "bold" },
		b = { bg = colors.bg, fg = colors.fg },
		c = { bg = colors.bg, fg = colors.fg },
	},
	inactive = {
		a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
		b = { bg = colors.inactive_bg, fg = colors.semilightgray },
		c = { bg = colors.inactive_bg, fg = colors.semilightgray },
	},
}

M.theme = custom_lualine_theme

return M
