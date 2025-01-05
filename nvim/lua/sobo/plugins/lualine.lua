return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		-- last time udpated these colors were based on solarized dark theme
		local colors = {
			darkgray = "#003440",
			gray = "#eee7d4",
			normal = "#268ad1",
			insert = "#859801",
			visual = "#b48800",
			replace = "#db4b4b",
			command = "#d23581",
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
					"#b48800"
				),
				info = utils.extract_color_from_hllist(
					{ "fg", "sp" },
					{ "DiagnosticInfo", "LspDiagnosticsDefaultInformation", "DiffChange" },
					"#859801"
				),
				hint = utils.extract_color_from_hllist(
					{ "fg", "sp" },
					{ "DiagnosticHint", "LspDiagnosticsDefaultHint", "DiffAdd" },
					"#268ad1"
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
				local icons = { " ", " ", " ", " " }
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
				color_icons = true,
				-- theme = "github_dark_default",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {},
				always_divide_middle = true,

				theme = {
					inactive = {
						a = { fg = colors.gray, bg = colors.outerbg },
						b = { fg = colors.gray, bg = colors.outerbg },
						c = { fg = colors.gray, bg = colors.innerbg },
					},
					visual = {
						a = { fg = colors.darkgray, bg = colors.visual },
						b = { fg = colors.gray, bg = colors.outerbg },
						c = { fg = colors.gray, bg = colors.innerbg },
					},
					replace = {
						a = { fg = colors.darkgray, bg = colors.replace },
						b = { fg = colors.gray, bg = colors.outerbg },
						c = { fg = colors.gray, bg = colors.innerbg },
					},
					normal = {
						a = { fg = colors.darkgray, bg = colors.normal },
						b = { fg = colors.gray, bg = colors.outerbg },
						c = { fg = colors.gray, bg = colors.innerbg },
					},
					insert = {
						a = { fg = colors.darkgray, bg = colors.insert },
						b = { fg = colors.gray, bg = colors.outerbg },
						c = { fg = colors.gray, bg = colors.innerbg },
					},
					command = {
						a = { fg = colors.darkgray, bg = colors.command },
						b = { fg = colors.gray, bg = colors.outerbg },
						c = { fg = colors.gray, bg = colors.innerbg },
					},
				},
			},
			sections = {
				lualine_a = { "mode" },
				-- lualine_b = { "branch", "diff" }, -- "diagnostics" },
				lualine_b = {
					{
						"branch",
						color = { fg = "#003440", bg = "#afafaf" }, -- White text on a blue background
					},
					{
						"diff",
						symbols = { added = " ", modified = "  ", removed = "  " }, -- Custom symbols
						diff_color = {
							added = { fg = "#ffffff", bg = "#859801" }, -- Green background for added
							modified = { fg = "#ffffff", bg = "#b48800" }, -- Yellow background for modified
							removed = { fg = "#ffffff", bg = "#db4b4b" }, -- Red background for removed
						},
						color = { fg = "#ffffff" }, -- Default foreground
					},
					-- "diagnostics", -- Keep diagnostics as is
				},
				lualine_c = {
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
							error = { fg = "#db4b4b" },
							warn = { fg = "#e0af68" },
							info = { fg = "#0db9d7" },
							hint = { fg = "#859801" },
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
						"filetype",
						colored = true,
						icon_only = true,
						icon = { align = "left" },
					},
					{
						"filename",
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
					-- {
					-- 	diagnostic_message,
					-- 	colors = {
					-- 		error = "#db4b4b",
					-- 		warn = "#b48800",
					-- 		info = "#859801",
					-- 		hint = "#268ad1",
					-- 	},
					-- },
				},

				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#2aa097" },
					},
					{ "encoding" },
					-- { "fileformat" },
					-- { "filetype" },
				},

				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = { "mode" },
				lualine_b = { "diff", "branch" }, -- "diagnostics" },
				lualine_c = { "filename" }, -- "os.date('%a')", "data", "require'lsp-status'.status()" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		})
	end,
}
