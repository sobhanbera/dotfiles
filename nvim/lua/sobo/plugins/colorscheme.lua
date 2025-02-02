return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			-- vim.cmd([[ set background=dark ]])
			-- vim.cmd([[ colorscheme tokyonight-moon ]])
			-- vim.cmd([[ hi SnacksIndentScope guifg=#909090 ]])
		end,
		-- keys = {
		-- 	{
		-- 		"<leader>it",
		-- 		function()
		-- 			-- check what theme is right now, light or dark
		-- 			local theme = vim.opt.background:get()
		-- 			if theme == "dark" then
		-- 				vim.cmd([[ set background=light ]])
		-- 				vim.cmd([[ colorscheme tokyonight-day ]])
		-- 			elseif theme == "light" then
		-- 				vim.cmd([[ set background=dark ]])
		-- 				vim.cmd([[ colorscheme tokyonight-moon]])
		-- 			else
		-- 				vim.cmd([[ set background=dark ]])
		-- 				vim.cmd([[ colorscheme tokyonight-moon ]])
		-- 			end
		-- 		end,
		-- 		desc = "Find git files",
		-- 	},
		-- },
	},

	{
		"maxmx03/solarized.nvim",
		priority = 1000,
		opts = {},
		config = function(_, opts)
			-- require("solarized").setup(opts)
			-- vim.cmd.colorscheme("solarized")
		end,
	},

	{
		"navarasu/onedark.nvim",
		priority = 1000,
		config = function()
			-- require("onedark").setup({
			-- 	style = "warm", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
			--
			-- 	toggle_style_key = "<leader>it",
			-- 	toggle_style_list = { "dark", "cool", "warm", "light" },
			--
			-- 	-- Lualine options --
			-- 	lualine = {
			-- 		transparent = true, -- lualine center bar transparency
			-- 	},
			--
			-- 	-- Plugins Config --
			-- 	diagnostics = {
			-- 		darker = true, -- darker colors for diagnostic
			-- 		undercurl = true, -- use undercurl instead of underline for diagnostics
			-- 		background = false, -- use background color for virtual text
			-- 	},
			-- })
			-- vim.cmd([[ colorscheme onedark ]])
		end,
	},

	{
		"projekt0n/github-nvim-theme",
		priority = 1000,
		config = function()
			-- vim.cmd([[ colorscheme github_light ]])
		end,
	},

	{
		"morhetz/gruvbox",
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("gruvbox")
		end,
	},

	{
		"ayu-theme/ayu-vim",
		priority = 1000,
		config = function()
			-- vim.cmd([[ let ayucolor="dark" ]])
			-- vim.cmd([[ colorscheme ayu ]])
		end,
	},

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

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "auto", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
					-- miscs = {}, -- Uncomment to turn off hard-coded styles
				},
				color_overrides = {},
				custom_highlights = {},
				default_integrations = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					indent_blankline = {
						enabled = true,
						scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
						colored_indent_levels = false,
					},
					mason = true,
					neotree = true,
					noice = true,
					copilot_vim = true,
					dap = true,
					dap_ui = true,
					treesitter_context = true,
					nvim_surround = false,
					telescope = {
						enabled = true,
						-- style = "nvchad"
					},
					lsp_trouble = true,
					which_key = true,
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})

			-- setup must be called before loading
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
