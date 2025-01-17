-- last time udpated these colors were based on solarized dark theme

local M = {}

local MAX_LENGTH = 200

-- tokyonight colors
local colors = {
	white = "#c0caf5",
	black = "#414868",

	darkgray = "#282C34",
	gray = "#ABB2BF",

	red = "#f7768e",
	yellow = "#e0af68",
	blue = "#7ba2f3",
	green = "#41b59b",
	purple = "#bb9af7",
	aqua = "#2ccde9",
}
-- onedark colors
local onedark_colors = {
	white = "#ABB2BF",
	black = "#282C34",

	darkgray = "#282C34",
	gray = "#ABB2BF",

	red = "#E06C75",
	yellow = "#E5C07B",
	blue = "#61AFEF",
	green = "#98C379",
	purple = "#C678DD",
	aqua = "#56B6C2",
}
-- gruvbox colors
local gruvbox_colors = {
	white = "#fdf6e3",
	black = "#002b36",

	darkgray = "#003440",
	gray = "#afafaf",

	red = "#db4b4b",
	yellow = "#d79921",
	blue = "#458588",
	green = "#98971a",
	purple = "#b16286",
	aqua = "#689d6a",
}

local utils = require("lualine.utils.utils")
local highlight = require("lualine.highlight")
local diagnostic_message = require("lualine.component"):extend()

diagnostic_message.default = {
	colors = {
		error = utils.extract_color_from_hllist(
			{ "fg", "sp" },
			{ "DiagnosticError", "LspDiagnosticsDefaultError", "DiffDelete" },
			"#db4b4b"
		),
		warning = utils.extract_color_from_hllist(
			{ "fg", "sp" },
			{ "DiagnosticWarn", "LspDiagnosticsDefaultWarning", "DiffText" },
			"#d79921"
		),
		info = utils.extract_color_from_hllist(
			{ "fg", "sp" },
			{ "DiagnosticInfo", "LspDiagnosticsDefaultInformation", "DiffChange" },
			"#458588"
		),
		hint = utils.extract_color_from_hllist(
			{ "fg", "sp" },
			{ "DiagnosticHint", "LspDiagnosticsDefaultHint", "DiffAdd" },
			"#98971a"
		),
	},
}

function diagnostic_message:init(options)
	diagnostic_message.super:init(options)

	self.options.colors = vim.tbl_extend("force", diagnostic_message.default.colors, self.options.colors or {})
	self.highlights = { error = "", warn = "", info = "", hint = "" }

	self.highlights.error = highlight.create_component_highlight_group(
		{ fg = self.options.colors.error },
		"diagnostic_message_error",
		self.options
	)
	self.highlights.warn = highlight.create_component_highlight_group(
		{ fg = self.options.colors.warn },
		"diagnostic_message_warn",
		self.options
	)
	self.highlights.info = highlight.create_component_highlight_group(
		{ fg = self.options.colors.info },
		"diagnostic_message_info",
		self.options
	)
	self.highlights.hint = highlight.create_component_highlight_group(
		{ fg = self.options.colors.hint },
		"diagnostic_message_hint",
		self.options
	)
end

function diagnostic_message:update_status(is_focused)
	local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
	local diagnostics = vim.diagnostic.get(0, { lnum = r - 1 })
	if #diagnostics > 0 then
		local diag = diagnostics[1]
		for _, d in ipairs(diagnostics) do
			if d.severity < diag.severity then
				diagnostics = d
			end
		end

		-- icons and highlight colors mapped according to sequence of severity
		-- error, warn, info, hint
		-- icons = { "", "", "", "" }
		local icons = { "", " ", " ", " " }
		local final_highlight_color =
			{ self.highlights.error, self.highlights.warn, self.highlights.info, self.highlights.hint }

		-- for _, val in ipairs({ "Error", "Warn", "Info", "Hint" }) do
		-- 	vim.fn.sign_define("DiagnosticSign" .. val, {
		-- 		text = "",
		-- 		texthl = "DiagnosticSign" .. val,
		-- 		linehl = "",
		-- 		numhl = "DiagnosticSign" .. val,
		-- 	})
		-- end

		-- vim.diagnostic.config({
		-- 	virtual_text = {
		-- 		enabled = false,
		-- 		prefix = "●'", -- Could be '●', '▎', 'x', ■
		-- 	},
		-- })

		local final_message = highlight.component_format_highlight(final_highlight_color[diag.severity])
			.. " "
			.. icons[diag.severity]
			.. " "
			.. diag.message

		-- if the length of final message is more than 150 characters, then truncate it
		if string.len(final_message) > MAX_LENGTH then
			final_message = string.sub(final_message, 1, MAX_LENGTH) .. "..."
		end

		return final_message
	else
		return ""
	end
end

M.colors = colors
M.diagnostic_message = diagnostic_message

return M
