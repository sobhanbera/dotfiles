return {
	"folke/zen-mode.nvim",
	event = "BufEnter",
	opts = {},
	config = function()
		require("zen-mode").setup({
			window = {
				width = 0.75,
				height = 1,

				backdrop = 1,
				-- options = {
				-- cursorline = true,
				-- number = true,
				-- relativenumber = true,
				-- signcolumn = "no",
				-- list = false,
				-- },
			},
		})

		vim.api.nvim_set_keymap(
			"n",
			"<leader>fm",
			"<cmd>lua require('zen-mode').toggle()<CR>",
			{ noremap = true, silent = true }
		)
	end,
}
