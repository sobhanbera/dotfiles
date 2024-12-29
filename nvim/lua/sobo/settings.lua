-- ----------------------------- --
--           Settings            --
-- ----------------------------- --
USER = vim.fn.expand("$USER")

vim.o.exrc = true
vim.o.encoding = "UTF-8"
vim.o.mouse = "a"
vim.o.guicursor = ""
vim.o.smarttab = true
vim.o.undodir = "/Users/" .. USER .. "/Workspace/cache/nvim/undodir"
vim.o.hidden = true
vim.o.cmdheight = 1
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.updatetime = 200
vim.o.shortmess = "a"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.guicursor = "i:block-iCursor-blinkwait700-blinkon400-blinkoff250"
-- vim.o.guicursor = "i:ver75-iCursor-blinkwait700-blinkon400-blinkoff250"
-- vim.o.guicursor = "n-v-c:block,i:ver25-CursorInsert"
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.fsync = true
vim.o.pumheight = 12

vim.wo.relativenumber = true
vim.wo.nu = true
vim.wo.scrolloff = 0
vim.wo.colorcolumn = "120"
vim.wo.signcolumn = "yes"
vim.wo.cursorline = true
vim.wo.numberwidth = 3
-- vim.wo.foldmethod = "expr"

vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true
vim.bo.autoindent = true
vim.bo.smartindent = true
-- vim.bo.textwidth = 120

vim.cmd [[ set nowrap ]]
vim.cmd [[ set noswapfile nobackup undofile ]]
vim.cmd [[ set history=10000 ]]
vim.cmd [[ set backspace=indent,eol,start whichwrap+=<,>,[,] ]]
vim.cmd [[ set completeopt-=preview ]]

-- define a boundary to have a over length
vim.cmd [[ augroup vimrc_autocmds ]]
vim.cmd [[ autocmd BufEnter * match OverLength /\\%120v.*/ ]]
vim.cmd [[ augroup END ]]
