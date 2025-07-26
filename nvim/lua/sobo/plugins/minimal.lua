return {
	{
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)

			-- let g:startify_files_number = 10
			-- vim.cmd([[ let g:startify_files_number = 30 ]])
		end,
	},

	{
		"rasulomaroff/reactive.nvim",
		config = function()
			require("reactive").setup({
				builtin = {
					cursorline = true,
					cursor = true,
					modemsg = true,
				},
			})
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
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"machakann/vim-sandwich",
		},
	},

	{
		"brenoprata10/nvim-highlight-colors",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-highlight-colors").setup({
				render = "background", -- background, foreground, virtual
				virtual_symbol = "■",
			})
		end,
	},

	{
		"mbbill/undotree",
		event = { "BufReadPre", "BufNewFile" },
		config = function() end,
		keys = {
			{ "<leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>", desc = "Toggle Undo Tree" },
		},
	},

	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = "cd app && npx --yes yarn install",
	},

	{
		"wakatime/vim-wakatime",
	},

	{
		"jiangmiao/auto-pairs",
		event = { "BufReadPre", "BufNewFile" },
		-- 'easymotion/vim-easymotion',
		-- 'psliwka/vim-smoothie',
	},

	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({
				mappings = { -- Keys to be mapped to their corresponding default scrolling animation
					"<C-u>",
					"<C-d>",
					"<C-b>",
					"<C-f>",
					"<C-y>",
					"<C-e>",
					"zt",
					"zz",
					"zb",
				},
				hide_cursor = false, -- Hide cursor while scrolling
				stop_eof = true, -- Stop at <EOF> when scrolling downwards
				respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				duration_multiplier = 0.6, -- Global duration multiplier
				easing = "linear", -- Default easing function
				pre_hook = nil, -- Function to run before the scrolling animation starts
				post_hook = nil, -- Function to run after the scrolling animation ends
				performance_mode = false, -- Disable "Performance Mode" on all buffers.
				ignored_events = { -- Events ignored while scrolling
					"WinScrolled",
					"CursorMoved",
				},
			})
		end,
	},
}
