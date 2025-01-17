return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			vim.cmd([[ colorscheme tokyonight-moon ]])
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
}
