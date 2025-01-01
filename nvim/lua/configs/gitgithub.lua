-- fugitive
local map = require("sobo.keymaps").map
map("n", "gst", ":G<CR>")
map("n", "gct", ":Git commit<CR>")
map("n", "gp", ":Git push<CR>")
map("n", "gpl", ":Git pull<CR>")
map("n", "<leader>gd", ":Gvdiffsplit<CR>")
-- map("n", "<leader>gb", ":Git blame<CR>")

local gitsigs = require("gitsigns")
gitsigs.setup({
	signs = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged_enable = true,
})

map("n", "<leader>gh", ":Gitsigns preview_hunk<CR>")
map("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>")
map("n", "<leader>gb", ":Gitsigns blame<CR>")

-- gitgutter, gitgutter signs
-- vim.cmd("let g:gitgutter_sign_added = '┃'")
-- vim.cmd("let g:gitgutter_sign_modified = '┃'")
-- vim.cmd("let g:gitgutter_sign_removed = '┃'")
-- vim.cmd("let g:gitgutter_sign_removed_first_line = '┃'")
-- vim.cmd("let g:gitgutter_sign_removed_above_and_below = '┃'")
-- vim.cmd("let g:gitgutter_sign_modified_removed = '┃'")

-- vim.cmd("let g:gitgutter_sign_added = '+'")
-- vim.cmd("let g:gitgutter_sign_modified = '•'")
-- vim.cmd("let g:gitgutter_sign_removed = '-'")
--
-- vim.cmd("let g:gitgutter_sign_removed_first_line = '^'")
-- vim.cmd("let g:gitgutter_sign_removed_above_and_below = '*'")
-- vim.cmd("let g:gitgutter_sign_modified_removed = '.'")
