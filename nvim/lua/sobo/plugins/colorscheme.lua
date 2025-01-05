return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			-- vim.cmd([[ colorscheme tokyonight ]])
		end,
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
			-- vim.cmd([[ colorscheme onedark ]])

			require("onedark").setup({
				-- Main options --
				style = "darker", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
				transparent = false, -- Show/hide background
				term_colors = true, -- Change terminal color as per the selected theme style
				ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
				cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

				-- toggle theme style ---
				toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
				toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

				-- Change code style ---
				-- Options are italic, bold, underline, none
				-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
				code_style = {
					comments = "italic",
					keywords = "none",
					functions = "none",
					strings = "none",
					variables = "none",
				},

				-- Lualine options --
				lualine = {
					transparent = false, -- lualine center bar transparency
				},

				-- Custom Highlights --
				colors = {}, -- Override default colors
				highlights = {}, -- Override highlight groups

				-- Plugins Config --
				diagnostics = {
					darker = true, -- darker colors for diagnostic
					undercurl = true, -- use undercurl instead of underline for diagnostics
					background = true, -- use background color for virtual text
				},
			})
		end,
	},

	{
		"projekt0n/github-nvim-theme",
		priority = 1000,
		config = function()
			-- vim.cmd([[ colorscheme github_dark ]])
		end,
	},

	{
		"morhetz/gruvbox",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gruvbox")
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
}
