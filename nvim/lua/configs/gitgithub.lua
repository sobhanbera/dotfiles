-- fugitive
local map = require("sobo.keymaps").map
map("n", "gst", ":G<CR>")
map("n", "gct", ":Git commit<CR>")
map("n", "gp", ":Git push<CR>")
map("n", "gpl", ":Git pull<CR>")
map("n", "<leader>dg", ":Gvdiffsplit<CR>")

-- gitgutter, gitgutter signs
vim.cmd("let g:gitgutter_sign_added = '+'")
vim.cmd("let g:gitgutter_sign_modified = '•'")
vim.cmd("let g:gitgutter_sign_removed = '-'")
vim.cmd("let g:gitgutter_sign_removed_first_line = '^'")
vim.cmd("let g:gitgutter_sign_removed_above_and_below = '*'")
vim.cmd("let g:gitgutter_sign_modified_removed = '.'")
