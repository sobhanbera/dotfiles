return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")
		local diagnosticMessage = require("sobo.plugins.diagnostics.message")

		local colors = diagnosticMessage.colors
		local diagnostic_message = diagnosticMessage.diagnostic_message

		lualine.setup({
			options = {
				icons_enabled = true,
				color_icons = true,
				theme = "onedark",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				-- component_separators = { left = "", right = "" },
				-- component_separators = { left = '', right = '' },
				disabled_filetypes = {},
				always_divide_middle = false,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{
						"branch",
						color = { fg = colors.black, bg = colors.gray }, -- White text on a blue background
					},
					{
						"filename",
						-- icon = function()
						-- 	local devicons = require('nvim-web-devicons')
						--
						-- 	local filename = vim.fn.expand('%:t')  -- Get the current file name
						-- 	local icon, _ = devicons.get_icon(filename)
						--
						-- 	print(icon)  -- Print the icon
						-- 	return  icon
						-- end,
						path = 0, -- 0: Just the filename
						-- 1: Relative path
						-- 2: Absolute path

						shorting_target = 52,
						file_status = true,
						symbols = {
							modified = "●",
							readonly = "--",
							unnamed = ":D",
						},
					},
					{
						"filetype",
						colored = true,
						icon_only = true,
					},
				},
				lualine_c = {
					{
						"diff",
						symbols = { added = " ", modified = "  ", removed = "  " }, -- Custom symbols
						diff_color = {
							added = { fg = colors.white, bg = colors.green },
							modified = { fg = colors.white, bg = colors.yellow },
							removed = { fg = colors.white, bg = colors.red },
						},
						color = { fg = colors.white },
					},
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						sections = { "error", "warn", "info", "hint" },
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = " ",
						},
						diagnostics_color = {
							error = { fg = colors.red },
							warn = { fg = colors.yellow },
							info = { fg = colors.blue },
							hint = { fg = colors.green },
						},
						colored = true,
						update_in_insert = false,
						always_visible = false,
						cond = function()
							local diagnostics = vim.diagnostic.get(0)
							return #diagnostics > 0
						end,
					},
					{
						diagnostic_message,
						colors = {
							error = colors.red,
							warn = colors.yellow,
							info = colors.blue,
							hint = colors.green,
						},
						max_length = 100,
					},
				},

				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = colors.aqua },
					},
					{ "encoding" },
				},
				lualine_y = { "progress" },
				lualine_z = {
					"location",
					{
						"datetime",
						style = "%I:%M:%S %p",
						color = { fg = colors.white, bg = colors.green },
					},
				},
			},
			inactive_sections = {
				lualine_a = { "mode" },
				lualine_b = { "diff", "branch" }, -- "diagnostics" },
				lualine_c = { "filename" }, -- "os.date('%a')", "data", "require'lsp-status'.status()" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
