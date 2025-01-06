USER = vim.fn.expand("$USER")

local g = vim.g
local o = vim.o
local wo = vim.wo
local bo = vim.bo

g.mapleader = " "

o.exrc = true
o.encoding = "UTF-8"
o.mouse = "a"
o.smarttab = true
o.undodir = "/Users/" .. USER .. "/Workspace/cache/nvim/undodir"
o.hidden = true
o.cmdheight = 1
o.smartcase = true
o.ignorecase = true
o.incsearch = true
o.hlsearch = true
o.completeopt = "menuone,noinsert,noselect"
o.updatetime = 200
o.shortmess = "a"
o.splitbelow = true
o.splitright = true
-- o.guicursor = "i:block-iCursor-blinkwait700-blinkon400-blinkoff250"
o.guicursor = "i:ver25-iCursor-blinkwait700-blinkon400-blinkoff250"
-- o.guicursor = "n-v-c:block,i:ver25-CursorInsert"
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.fsync = true
o.pumheight = 12

wo.relativenumber = true
wo.nu = true
wo.scrolloff = 0
wo.colorcolumn = "120"
wo.signcolumn = "yes"
wo.cursorline = true
wo.numberwidth = 3
wo.foldcolumn = "1"
wo.foldmethod = "indent"
wo.foldlevel = 99 -- open all folds by default

bo.tabstop = 2
bo.softtabstop = 2
bo.shiftwidth = 2
bo.expandtab = true
bo.autoindent = true
bo.smartindent = true
-- bo.textwidth = 120

vim.cmd([[ set nowrap ]])
vim.cmd([[ set noswapfile nobackup undofile ]])
vim.cmd([[ set history=10000 ]])
-- vim.cmd [[ set backspace=indent,eol,start whichwrap+=<,>,[,] ]]
vim.cmd([[ set completeopt-=preview ]])
vim.cmd([[ set nolist ]])

-- define a boundary to have a over length
vim.cmd([[ augroup vimrc_autocmds ]])
vim.cmd([[ autocmd BufEnter * match OverLength /\\%120v.*/ ]])
vim.cmd([[ augroup END ]])

vim.cmd([[
	augroup SetFoldLevelOnBufferChange
		autocmd!
		autocmd BufEnter * if &filetype =~# 'TelescopePrompt\|neo-tree' | setlocal nofoldenable | endif
	augroup END
]])
