local map = require('sobhanbera.mappings').map
local opts = { noremap = false, silent = true}
map('n', 's', '<Plug>(easymotion-s2)', opts)
map('n', 't', '<Plug>(easymotion-t2)', opts)
map('n', '<Leader>j', '<Plug>(easymotion-j)', opts)
map('n', '<Leader>k', '<Plug>(easymotion-k)', opts)
map('n', '<Leader>l', '<Plug>(easymotion-lineforward)', opts)
map('n', '<Leader>j', '<Plug>(easymotion-j)', opts)
map('n', '<Leader>k', '<Plug>(easymotion-k)', opts)
map('n', '<Leader>h', '<Plug>(easymotion-linebackward)', opts)
vim.g.EasyMotion_startofline = 0