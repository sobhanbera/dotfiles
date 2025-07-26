return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")
		local diagnosticMessage = require("sobo.plugins.diagnostics.message")

		local colors = diagnosticMessage.colors
		local diagnostic_message = diagnosticMessage.diagnostic_message
		local custom_theme = require("sobo.plugins.themes.custom").theme

		lualine.setup({
			options = {
				icons_enabled = true,
				color_icons = true,
				-- theme = "tokyonight-moon",
				theme = "auto",
				-- theme = "night-owl",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				-- component_separators = { left = "", right = "" },
				disabled_filetypes = { "neo-tree" },
				always_divide_middle = false,
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return str:sub(1, 1)
						end,
						-- color = { bg = colors.black },
					},
				},
				lualine_b = {
					{
						"branch",
						color = { fg = colors.white, bg = colors.black }, -- White text on a blue background
					},
					-- {
					-- 	"filetype",
					-- 	colored = true,
					-- 	icon_only = true,
					-- 	color = { fg = colors.white, bg = colors.black }, -- White text on a blue background
					-- },
					-- {
					-- 	"filename",
					-- 	-- icon = function()
					-- 	-- 	local devicons = require('nvim-web-devicons')
					-- 	--
					-- 	-- 	local filename = vim.fn.expand('%:t')  -- Get the current file name
					-- 	-- 	local icon, _ = devicons.get_icon(filename)
					-- 	--
					-- 	-- 	print(icon)  -- Print the icon
					-- 	-- 	return  icon
					-- 	-- end,
					-- 	path = 0, -- 0: Just the filename
					-- 	-- 1: Relative path
					-- 	-- 2: Absolute path
					--
					-- 	shorting_target = 52,
					-- 	file_status = true,
					-- 	symbols = {
					-- 		modified = "●",
					-- 		readonly = "--",
					-- 		unnamed = ":D",
					-- 	},
					-- 	color = { fg = colors.white, bg = colors.black }, -- White text on a blue background
					-- },
				},
				lualine_c = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						sections = { "error", "warn", "info", "hint" },
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = " ",
							-- error = " ",
							-- warn = " ",
							-- info = " ",
							-- hint = " ",
						},
						diagnostics_color = {
							hint = { fg = colors.green, bg = colors.black },
							error = { fg = colors.red, bg = colors.black },
							warn = { fg = colors.yellow, bg = colors.black },
							info = { fg = colors.blue, bg = colors.black },
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
						max_length = 0, -- disabled here
					},
				},

				lualine_x = {
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " }, -- Custom symbols
						diff_color = {
							added = { bg = colors.black, fg = colors.green },
							removed = { bg = colors.black, fg = colors.red },
							modified = { bg = colors.black, fg = colors.blue },
						},
						color = { bg = colors.black, fg = colors.white },
					},
					{
						"encoding",
						color = { bg = colors.black, fg = colors.white },
					},
				},
				lualine_y = {},
				lualine_z = {
					{
						"progress",
						color = { bg = colors.black, fg = colors.blue },
					},
					{
						"location",
						color = { bg = colors.black, fg = colors.yellow },
					},
					{
						"datetime",
						style = "%I:%M",
						color = { bg = colors.black, fg = colors.purple },
					},
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { bg = colors.black, fg = colors.white },
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
