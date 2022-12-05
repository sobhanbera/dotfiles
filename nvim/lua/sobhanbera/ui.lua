-- +-----------------------------------------------------+
-- |                     COLORSCHEME                     |
-- +-----------------------------------------------------+
-- vim.cmd('let g:gruvbox_contrast_dark = "hard"')
vim.cmd("set encoding=utf-8")
vim.cmd("set termguicolors")
-- vim.cmd('let ayucolor="mirage"')
vim.cmd("colorscheme github_dark")

vim.cmd("hi Normal guibg=NONE")
vim.cmd("hi NormalNC guibg=NONE")

vim.cmd("hi CursorLine gui=NONE cterm=NONE guibg=NONE ctermbg=NONE")
vim.cmd("hi CursorLineNr guibg=NONE")
-- vim.cmd("hi CursorLine gui=NONE cterm=NONE guibg=#2b2b2b ctermbg=0")
-- vim.cmd("hi CursorLineNr guibg=#2b2b2b")

-- vim.cmd("hi ColorColumn ctermbg=0 guibg=NONE")
-- vim.cmd("hi OverLength ctermbg=NONE ctermfg=NONE guibg=#795E19 guifg=#ffffff")

vim.cmd("hi VertSplit guibg=NONE")

-- vim.cmd("hi StatusLine guibg=NONE")
-- vim.cmd("hi StatusLineNC guibg=NONE")

-- vim.cmd("hi NumberLine ctermbg=0 guibg=NONE")

-- extra highlights
-- vim.cmd("hi SignColumn guibg=NONE")
-- vim.cmd("hi NvimTreeNormal guibg=NONE guifg=#dfdfdf")
-- vim.cmd("hi NvimTreeNormalNC guibg=NONE guifg=#dfdddf")

-- highlight related to "cmp" plugins
-- vim.cmd("highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080")
-- vim.cmd("highlight! CmpItemAbbrMatch guibg=NONE guifg=#FDAB43")
-- vim.cmd("highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#FDAB43")
-- vim.cmd("highlight! CmpItemKindVariable guibg=NONE guifg=#599FDA")
-- vim.cmd("highlight! CmpItemKindInterface guibg=NONE guifg=#6948A5")
-- vim.cmd("highlight! CmpItemKindText guibg=NONE guifg=#1E79CE")
-- vim.cmd("highlight! CmpItemKindFunction guibg=NONE guifg=#D47B3A")
-- vim.cmd("highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0")
-- vim.cmd("highlight! CmpItemKindKeyword guibg=NONE guifg=#CF9A53")
-- vim.cmd("highlight! CmpItemKindProperty guibg=NONE guifg=#559FD3")
-- vim.cmd("highlight! CmpItemKindUnit guibg=NONE guifg=#B94B49")

-- highlights for diagnostic
-- vim.cmd("hi DiagnosticError ctermbg=12 ctermfg=NONE guibg=NONE guifg=#F24B42") -- highlights for errors
-- vim.cmd("hi DiagnosticWarn ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#FCA534") -- highlights for warnings
-- vim.cmd("hi DiagnosticInfo ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#AEFA47") -- highlights for info
-- vim.cmd("hi DiagnosticHint ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#14BC85") -- highlight for hint in diagnostic

-- menu related highlights
-- vim.cmd("hi Pmenu guibg=NONE") -- auto-complete or any menu highlight
-- vim.cmd("hi PmenuSel guibg=#015e99 guifg=#ffffff") -- highlight for the currently selected menu item
-- vim.cmd("hi PmenuSbar guibg=#015e99") -- the scrollbar highlight
-- vim.cmd("hi PmenuThumb guibg=#eee8d5") -- the thumb highlight in menu scrollbar

-- search and visual highlight
-- vim.cmd("hi Search guibg=#2B313F guifg=#57A9DE") -- highlight for the search terms
-- vim.cmd("hi Visual guibg=#2B313F") -- highlight for the code selection in visual mode
