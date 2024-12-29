-- alpha
require("alpha").setup(require("alpha.themes.startify").config)


-- comment
require("Comment").setup()


-- cursorline (Cursorword plugin)
require("nvim-cursorline").setup({
  cursorline = {
    enable = true,
    timeout = 1000,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  },
})


-- indent blankline
-- require("ibl").setup()
-- setting up indent blankline for dashboard plugin or while starting nvim
-- vim.cmd("autocmd FileType dashboard :IndentBlanklineDisable")

-- nvim highlight colors in file
require("nvim-highlight-colors").setup({
	render = 'background',
	virtual_symbol = '■',
})

-- undotree
vim.keymap.set("n", "<Leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>", {
  noremap = true,
  silent = true
})
require("configs.barbartabs")
