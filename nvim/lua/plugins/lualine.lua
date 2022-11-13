local colors = {
	darkgray = "#272727",
	gray = "#efefef",
	innerbg = nil,
	outerbg = "#172b41",
	normal = "#6cb6ff",
	insert = "#8ddb8c",
	visual = "#f69d50",
	replace = "#ff938a",
	command = "#39c5cf",
}

require("lualine").setup({
	options = {
		icons_enabled = true,
		-- theme = "github_dark_default",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
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
					unnamed = "Unnamed", -- Text to show for unnamed buffers.
				},
			},
		},
		lualine_x = { "encoding", "fileformat", "filetype" },
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
