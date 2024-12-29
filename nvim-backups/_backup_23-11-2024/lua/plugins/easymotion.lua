local map = require("sobhanbera.mappings").map

local opts = { noremap = false, silent = true }
local opts2 = { noremap = true, silent = true }

map("n", "s", "<Plug>(easymotion-s2)", opts)
map("n", "s", "<Plug>(easymotion-overwin-f2)", opts)

map("n", "t", "<Plug>(easymotion-t2)", opts)

map("n", "<Leader>j", "<Plug>(easymotion-j)", opts)
map("n", "<Leader>k", "<Plug>(easymotion-k)", opts)
map("n", "<Leader>l", "<Plug>(easymotion-lineforward)", opts)
map("n", "<Leader>h", "<Plug>(easymotion-linebackward)", opts)

map("n", "<Leader>w", "<Plug>(easymotion-w)", opts)
map("n", "<Leader>w", "<Plug>(easymotion-overwin-w)", opts2)

map("n", "f", "<Plug>(easymotion-bd-f)", opts)
map("n", "f", "<Plug>(easymotion-overwin-f)", opts2)

-- map("n", "/", "<Plug>(easymotion-sn)", opts)

-- map("n", "n", "<Plug>(easymotion-next)", opts)
-- map("n", "N", "<Plug>(easymotion-prev)", opts)

vim.g.EasyMotion_startofline = 0
