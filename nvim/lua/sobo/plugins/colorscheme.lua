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
			require("onedark").setup({
				style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'

				toggle_style_key = "<leader>ot",
				toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" },

				-- Lualine options --
				lualine = {
					transparent = true, -- lualine center bar transparency
				},

				-- Plugins Config --
				diagnostics = {
					darker = true, -- darker colors for diagnostic
					undercurl = true, -- use undercurl instead of underline for diagnostics
					background = true, -- use background color for virtual text
				},
			})

			vim.cmd([[ colorscheme onedark ]])
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
}
