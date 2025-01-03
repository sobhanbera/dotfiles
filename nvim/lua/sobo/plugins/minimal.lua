return {
	{
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},

	{
		"yamatsum/nvim-cursorline",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-cursorline").setup({
				cursorline = {
					enable = false, -- NOTE: don't enable this, else a lag could be experienced when moving cursor, very annoying
					timeout = 1000,
					number = false,
				},
				cursorword = {
					enable = true,
					min_length = 3,
					hl = { underline = true },
				},
			})
		end,
	},

	{
		"tpope/vim-surround",
		dependencies = {
			"machakann/vim-sandwich",
		},
		event = { "BufReadPre", "BufNewFile" },
	},

	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({
				render = "background",
				virtual_symbol = "■",
			})
		end,
	},

	{
		"mbbill/undotree",
		config = function() end,
		keys = {
			{ "<leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>", desc = "Toggle Undo Tree" },
		},
	},

	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npx --yes yarn install",
	},

	{
		"wakatime/vim-wakatime",
		"jiangmiao/auto-pairs",
		-- 'easymotion/vim-easymotion',
		-- 'psliwka/vim-smoothie',
	},
}
