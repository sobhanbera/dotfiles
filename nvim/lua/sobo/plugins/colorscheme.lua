return {
	{
		"tiagovla/tokyodark.nvim",
		opts = {
			-- custom options here
		},
		config = function(_, opts)
			require("tokyodark").setup({
				transparent_background = false, -- set background to transparent
				gamma = 1.00,               -- adjust the brightness of the theme
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					identifiers = { italic = true },
					functions = {},
					variables = {},
					strings = { italic = true },
				},
				custom_highlights = {} or function(highlights, palette)
					return {}
				end, -- extend highlights
				custom_palette = {} or function(palette)
					return {}
				end,                -- extend palette
				terminal_colors = true, -- enable terminal colors
			})                    -- calling setup is optional
			vim.cmd [[colorscheme tokyodark]]
		end,
	},

	-- {
	-- 	'maxmx03/solarized.nvim',
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	---@type solarized.config
	-- 	opts = {},
	-- 	config = function(_, opts)
	-- 		vim.o.termguicolors = true
	-- 		vim.cmd.colorscheme 'solarized'

	-- 		require('solarized').setup({
	-- 			transparent = {
	-- 				enabled = true,
	-- 				pmenu = true,
	-- 				normal = true,
	-- 				normalfloat = true,
	-- 				neotree = true,
	-- 				nvimtree = true,
	-- 				whichkey = true,
	-- 				telescope = true,
	-- 				lazy = true,
	-- 			},
	-- 			on_highlights = nil,
	-- 			on_colors = nil,
	-- 			palette = 'solarized', -- solarized (default) | selenized
	-- 			variant = 'summer', -- "spring" | "summer" | "autumn" | "winter" (default)
	-- 			error_lens = {
	-- 				text = true,
	-- 				symbol = true,
	-- 			},
	-- 			styles = {
	-- 				enabled = true,
	-- 				types = {},
	-- 				functions = { "italic" },
	-- 				parameters = {},
	-- 				comments = { "italic" },
	-- 				strings = { "italic" },
	-- 				keywords = {},
	-- 				variables = {},
	-- 				constants = {},
	-- 			},
	-- 			plugins = {
	-- 				treesitter = true,
	-- 				lspconfig = true,
	-- 				navic = true,
	-- 				cmp = true,
	-- 				indentblankline = true,
	-- 				neotree = true,
	-- 				nvimtree = true,
	-- 				whichkey = true,
	-- 				dashboard = true,
	-- 				gitsigns = true,
	-- 				telescope = true,
	-- 				noice = true,
	-- 				hop = true,
	-- 				ministatusline = true,
	-- 				minitabline = true,
	-- 				ministarter = true,
	-- 				minicursorword = true,
	-- 				notify = true,
	-- 				rainbowdelimiters = true,
	-- 				bufferline = true,
	-- 				lazy = true,
	-- 				rendermarkdown = true,
	-- 				ale = true,
	-- 				coc = true,
	-- 				leap = true,
	-- 				alpha = true,
	-- 				yanky = true,
	-- 				gitgutter = true,
	-- 				mason = true,
	-- 				flash = true,
	-- 			},

	-- 		})
	-- 	end,
	-- },

	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			flavour = "mocha", -- latte, frappe, macchiato, mocha
	-- 			background = { -- :h background
	-- 				light = "latte",
	-- 				dark = "mocha",
	-- 			},
	-- 			transparent_background = false, -- disables setting the background color.
	-- 			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
	-- 			term_colors = true,         -- sets terminal colors (e.g. `g:terminal_color_0`)
	-- 			dim_inactive = {
	-- 				enabled = true,           -- dims the background color of inactive window
	-- 				shade = "dark",
	-- 				percentage = 0.15,        -- percentage of the shade to apply to the inactive window
	-- 			},
	-- 			no_italic = false,          -- Force no italic
	-- 			no_bold = false,            -- Force no bold
	-- 			no_underline = false,       -- Force no underline
	-- 			styles = {                  -- Handles the styles of general hi groups (see `:h highlight-args`):
	-- 				comments = { "italic" },  -- Change the style of comments
	-- 				conditionals = { "italic" },
	-- 				loops = {},
	-- 				functions = { "italic" },
	-- 				keywords = {},
	-- 				strings = { "italic" },
	-- 				variables = {},
	-- 				numbers = {},
	-- 				booleans = {},
	-- 				properties = {},
	-- 				types = {},
	-- 				operators = {},
	-- 				-- miscs = {}, -- Uncomment to turn off hard-coded styles
	-- 			},
	-- 			color_overrides = {},
	-- 			custom_highlights = {},
	-- 			default_integrations = true,
	-- 			integrations = {
	-- 				cmp = true,
	-- 				gitsigns = true,
	-- 				nvimtree = true,
	-- 				treesitter = true,
	-- 				notify = true,
	-- 				barbar = true,
	-- 				dropbar = {
	-- 					enabled = true,
	-- 					color_mode = true, -- enable color for kind's texts, not just kind's icons
	-- 				},
	-- 				mini = {
	-- 					enabled = true,
	-- 					indentscope_color = "",
	-- 				},
	-- 				indent_blankline = {
	-- 					enabled = true,
	-- 					scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
	-- 					colored_indent_levels = true,
	-- 				},
	-- 				mason = true,
	-- 				neotree = true,
	-- 				noice = true,
	-- 				copilot_vim = true,
	-- 				dap = true,
	-- 				dap_ui = true,
	-- 				treesitter_context = true,
	-- 				nvim_surround = true,
	-- 				telescope = {
	-- 					enabled = true,
	-- 					-- style = "nvchad"
	-- 				},
	-- 				lsp_trouble = true,
	-- 				which_key = true,
	-- 				native_lsp = {
	-- 					enabled = true,
	-- 					virtual_text = {
	-- 						errors = { "italic" },
	-- 						hints = { "italic" },
	-- 						warnings = { "italic" },
	-- 						information = { "italic" },
	-- 						ok = { "italic" },
	-- 					},
	-- 					underlines = {
	-- 						errors = { "underline" },
	-- 						hints = { "underline" },
	-- 						warnings = { "underline" },
	-- 						information = { "underline" },
	-- 						ok = { "underline" },
	-- 					},
	-- 					inlay_hints = {
	-- 						background = true,
	-- 					},
	-- 				},
	-- 			},
	-- 		})

	-- 		-- setup must be called before loading
	-- 		vim.cmd.colorscheme("catppuccin")
	-- 	end,
	-- },

	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		local transparent = false -- set to true if you would like to enable transparency

	-- 		local bg = "#011628"
	-- 		local fg = "#CBE0F0"

	-- 		local bg_dark = "#011423"
	-- 		local fg_dark = "#B4D0E9"

	-- 		local bg_highlight = "#143652"
	-- 		local bg_search = "#0A64AC"
	-- 		local bg_visual = "#275378"
	-- 		local fg_gutter = "#627E97"

	-- 		local border = "#547998"

	-- 		require("tokyonight").setup({
	-- 			style = "night",
	-- 			transparent = transparent,
	-- 			styles = {
	-- 				sidebars = transparent and "transparent" or "dark",
	-- 				floats = transparent and "transparent" or "dark",
	-- 			},
	-- 			on_colors = function(colors)
	-- 				colors.bg = bg
	-- 				colors.bg_dark = transparent and colors.none or bg_dark
	-- 				colors.bg_float = transparent and colors.none or bg_dark
	-- 				colors.bg_highlight = bg_highlight
	-- 				colors.bg_popup = bg_dark
	-- 				colors.bg_search = bg_search
	-- 				colors.bg_sidebar = transparent and colors.none or bg_dark
	-- 				colors.bg_statusline = transparent and colors.none or bg_dark
	-- 				colors.bg_visual = bg_visual
	-- 				colors.border = transparent and colors.none or border
	-- 				colors.fg = fg
	-- 				colors.fg_dark = fg_dark
	-- 				colors.fg_float = fg
	-- 				colors.fg_gutter = fg_gutter
	-- 				colors.fg_sidebar = fg_dark
	-- 			end,
	-- 		})

	-- 		vim.cmd([[ set background=dark ]])
	-- 		vim.cmd([[ colorscheme tokyonight-moon ]])
	-- 		vim.cmd([[ hi SnacksIndentScope guifg=#909090 ]])
	-- 	end,
	-- 	-- keys = {
	-- 	-- 	{
	-- 	-- 		"<leader>it",
	-- 	-- 		function()
	-- 	-- 			-- check what theme is right now, light or dark
	-- 	-- 			local theme = vim.opt.background:get()
	-- 	-- 			if theme == "dark" then
	-- 	-- 				vim.cmd([[ set background=light ]])
	-- 	-- 				vim.cmd([[ colorscheme tokyonight-day ]])
	-- 	-- 			elseif theme == "light" then
	-- 	-- 				vim.cmd([[ set background=dark ]])
	-- 	-- 				vim.cmd([[ colorscheme tokyonight-moon]])
	-- 	-- 			else
	-- 	-- 				vim.cmd([[ set background=dark ]])
	-- 	-- 				vim.cmd([[ colorscheme tokyonight-moon ]])
	-- 	-- 			end
	-- 	-- 		end,
	-- 	-- 		desc = "Find git files",
	-- 	-- 	},
	-- 	-- },
	-- },

	-- {
	-- 	"maxmx03/solarized.nvim",
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	config = function(_, opts)
	-- 		require("solarized").setup(opts)
	-- 		vim.cmd.colorscheme("solarized")
	-- 	end,
	-- },

	-- {
	-- 	"navarasu/onedark.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("onedark").setup({
	-- 			style = "warm", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	--
	-- 			toggle_style_key = "<leader>it",
	-- 			toggle_style_list = { "dark", "cool", "warm", "light" },
	--
	-- 			-- Lualine options --
	-- 			lualine = {
	-- 				transparent = true, -- lualine center bar transparency
	-- 			},
	--
	-- 			-- Plugins Config --
	-- 			diagnostics = {
	-- 				darker = true, -- darker colors for diagnostic
	-- 				undercurl = true, -- use undercurl instead of underline for diagnostics
	-- 				background = false, -- use background color for virtual text
	-- 			},
	-- 		})
	-- 		vim.cmd([[ colorscheme onedark ]])
	-- 	end,
	-- },

	-- {
	-- 	"projekt0n/github-nvim-theme",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[ colorscheme github_dark ]])
	-- 	end,
	-- },

	-- {
	-- 	"morhetz/gruvbox",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		-- vim.cmd.colorscheme("gruvbox")
	-- 	end,
	-- },

	-- {
	-- 	"ayu-theme/ayu-vim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[ colorscheme ayu ]])
	-- 		vim.cmd([[ set termguicolors ]])
	-- 		vim.cmd([[ let ayucolor="mirage" ]])
	-- 	end,
	-- },

	-- {
	-- 	"sainnhe/everforest",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.g.everforest_enable_italic = true
	-- 		vim.g.everforest_background = "light"
	-- 		vim.g.everforest_cursor = "green"
	-- 		vim.g.everforest_sign_column_background = "green"
	-- 		vim.g.everforest_diagnostic_text_highlight = 1
	-- 		vim.g.everforest_diagnostic_line_highlight = 1
	-- 		vim.g.everforest_current_word = "bold"
	--
	-- 		-- require("lualine").setup({
	-- 		-- 	options = {
	-- 		-- 		theme = "everforest",
	-- 		-- 	},
	-- 		-- })
	-- 		vim.cmd([[ colorscheme everforest ]])
	-- 	end,
	-- },

	-- {
	-- 	"oxfist/night-owl.nvim",
	-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		-- load the colorscheme here
	-- 		require("night-owl").setup()
	-- 		vim.cmd.colorscheme("night-owl")
	-- 	end,
	-- },
}
