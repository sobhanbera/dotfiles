local colors = {
	darkgray = "#272727",
	gray = "#efefef",
	innerbg = nil,
	outerbg = nil,
	normal = "#89b4f9",
	insert = "#a6e2a1",
	visual = "#f9e2af",
	replace = "#b4befe",
	command = "#f38ba8",
}

local utils = require("lualine.utils.utils")
local highlight = require("lualine.highlight")
local diagnostic_message = require("lualine.component"):extend()

diagnostic_message.default = {
	colors = {
		error = utils.extract_color_from_hllist(
			{ "fg", "sp" },
			{ "DiagnosticError", "LspDiagnosticsDefaultError", "DiffDelete" },
			"#EF717A"
		),
		warning = utils.extract_color_from_hllist(
			{ "fg", "sp" },
			{ "DiagnosticWarn", "LspDiagnosticsDefaultWarning", "DiffText" },
			"#FBDB9B"
		),
		info = utils.extract_color_from_hllist(
			{ "fg", "sp" },
			{ "DiagnosticInfo", "LspDiagnosticsDefaultInformation", "DiffChange" },
			"#D49EBD"
		),
		hint = utils.extract_color_from_hllist(
			{ "fg", "sp" },
			{ "DiagnosticHint", "LspDiagnosticsDefaultHint", "DiffAdd" },
			"#C3CE9C"
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
		local icons = { "", "", "", "" }
		local final_highlight_color =
			{ self.highlights.error, self.highlights.warn, self.highlights.info, self.highlights.hint }

		return highlight.component_format_highlight(final_highlight_color[diag.severity])
			.. " "
			.. icons[diag.severity]
			.. " "
			.. diag.message
	else
		return ""
	end
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		-- theme = "github_dark_default",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,

		theme = {
			inactive = {
				a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
				b = { fg = colors.gray, bg = colors.outerbg },
				c = { fg = colors.gray, bg = colors.innerbg },
			},
			visual = {
				a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
				b = { fg = colors.gray, bg = colors.outerbg },
				c = { fg = colors.gray, bg = colors.innerbg },
			},
			replace = {
				a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
				b = { fg = colors.gray, bg = colors.outerbg },
				c = { fg = colors.gray, bg = colors.innerbg },
			},
			normal = {
				a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
				b = { fg = colors.gray, bg = colors.outerbg },
				c = { fg = colors.gray, bg = colors.innerbg },
			},
			insert = {
				a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
				b = { fg = colors.gray, bg = colors.outerbg },
				c = { fg = colors.gray, bg = colors.innerbg },
			},
			command = {
				a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
				b = { fg = colors.gray, bg = colors.outerbg },
				c = { fg = colors.gray, bg = colors.innerbg },
			},
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			{
				"filename",
				file_status = true, -- Displays file status (readonly status, modified status)
				path = 0, -- 0: Just the filename
				-- 1: Relative path
				-- 2: Absolute path

				shorting_target = 52, -- Shortens path to leave 40 spaces in the window
				-- for other components. (terrible name, any suggestions?)
				symbols = {
					modified = " • ", -- Text to show when the file is modified.
					readonly = " - ", -- Text to show when the file is non-modifiable or readonly.
					unnamed = "Sobhan Bera", -- Text to show for unnamed buffers.
				},
			},
			{
				diagnostic_message,
				colors = {
					error = "#EF717A",
					warn = "#EBCB8B",
					info = "#A3BE8C",
					hint = "#B48EAD",
				},
			},
		},
		lualine_x = { "", "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename", "os.date('%a')", "data", "require'lsp-status'.status()" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
})
