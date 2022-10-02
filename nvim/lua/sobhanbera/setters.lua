-- +-----------------------------------------------------+
-- |                        SETTERS                      |
-- +-----------------------------------------------------+
USER = vim.fn.expand("$USER")

vim.o.exrc = true
vim.o.encoding = "UTF-8"
vim.o.mouse = "a"
vim.o.guicursor = ""
vim.o.smarttab = true
vim.o.undodir = "/Users/" .. USER .. "/Documents/cache/nvim/undodir"
vim.o.hidden = true
vim.o.cmdheight = 1
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.updatetime = 200
vim.o.shortmess = "c"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.guicursor = "i:ver25-iCursor-blinkwait700-blinkon400-blinkoff250"
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.showtabline = 0
vim.o.fsync = true

vim.wo.relativenumber = true
vim.wo.nu = true
vim.wo.scrolloff = 0
vim.wo.colorcolumn = "120"
vim.wo.signcolumn = "yes"
vim.wo.cursorline = true
-- vim.wo.foldmethod = "expr"

vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true
vim.bo.autoindent = true
vim.bo.smartindent = true
-- vim.bo.textwidth = 120

vim.cmd("set nowrap")
vim.cmd("set noswapfile nobackup undofile")
vim.cmd("set history=10000")
vim.cmd("set backspace=indent,eol,start whichwrap+=<,>,[,]")
vim.cmd("set completeopt-=preview")

-- define a boundary to have a over length
vim.cmd("augroup vimrc_autocmds")
vim.cmd("autocmd BufEnter * match OverLength /\\%120v.*/")
vim.cmd("augroup END")

-- vim.g.nvim_tree_show_icons = '{ "git": 1, "folders": 1, "files": 1, "folder_arrows": 1 }'
