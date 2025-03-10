vim.cmd([[ set encoding=utf-8 ]])
vim.cmd([[ set termguicolors ]])

vim.cmd("set background=dark")
-- vim.cmd([[ let ayucolor="dark" ]])
-- vim.cmd([[ colorscheme onedark ]])
-- vim.cmd([[ let g:gruvbox_italic=1 ]])
-- vim.cmd([[ colorscheme gruvbox ]])

-- vim.cmd [[ let ayucolor="mirage" ]]
-- vim.cmd [[ colorscheme nord ]]
-- vim.cmd [[ let g:gruvbox_contrast_dark = "hard" ]]

vim.cmd([[ hi Normal guibg=NONE ]])
vim.cmd([[ hi NormalNC guibg=NONE ]])
vim.cmd([[ hi NormalFloat guibg=NONE ]])

-- vim.cmd [[ hi CursorLine gui=NONE cterm=NONE guibg=NONE ctermbg=NONE ]]
-- vim.cmd [[ hi CursorLineNr guibg=NONE ]]
-- vim.cmd [[ hi CursorLine gui=NONE cterm=NONE guibg=NONE ctermbg=0 ]]
-- vim.cmd [[ hi CursorLineNr guibg=NONE ]]

vim.cmd([[ hi ColorColumn ctermbg=0 guibg=NONE ]])
vim.cmd([[ hi OverLength guibg=#795E19 guifg=#ffffff ]])

-- vim.cmd([[ hi WinSeparator guifg=#909090 ]])

-- vim.cmd [[ hi StatusLine guibg=NONE ]]
-- vim.cmd [[ hi StatusLineNC guibg=NONE ]]
-- vim.cmd [[ hi NumberLine ctermbg=0 guibg=NONE ]]

-- extra highlights
-- vim.cmd([[ hi LineNr guibg=NONE ]])
-- vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#bfbfbf" })
-- vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff" })
-- vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#bfbfbf" })

vim.cmd([[ hi SignColumn guibg=NONE ]])
-- vim.cmd([[ hi NvimTreeNormal guibg=NONE guifg=#afafaf ]])
-- vim.cmd([[ hi NvimTreeNormal guibg=NONE guifg=#afafaf ]])

vim.cmd([[ hi NeoTreeNormal guibg=NONE guifg=#41b59b ]])
vim.cmd([[ hi NeoTreeNormalNC guibg=NONE guifg=#41b59b ]])
vim.cmd([[ hi NeoTreeEndOfBuffer guibg=NONE guifg=#454545 ]])

-- highlight related to "cmp" plugins
-- vim.cmd [[ highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080 ]]
-- vim.cmd [[ highlight! CmpItemAbbrMatch guibg=NONE guifg=#FDAB43 ]]
-- vim.cmd [[ highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#FDAB43 ]]
-- vim.cmd [[ highlight! CmpItemKindVariable guibg=NONE guifg=#599FDA ]]
-- vim.cmd [[ highlight! CmpItemKindInterface guibg=NONE guifg=#6948A5 ]]
-- vim.cmd [[ highlight! CmpItemKindText guibg=NONE guifg=#1E79CE ]]
-- vim.cmd [[ highlight! CmpItemKindFunction guibg=NONE guifg=#D47B3A ]]
-- vim.cmd [[ highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0 ]]
-- vim.cmd [[ highlight! CmpItemKindKeyword guibg=NONE guifg=#CF9A53 ]]
-- vim.cmd [[ highlight! CmpItemKindProperty guibg=NONE guifg=#559FD3 ]]
-- vim.cmd [[ highlight! CmpItemKindUnit guibg=NONE guifg=#B94B49 ]]

-- highlights for diagnostic
-- vim.cmd [[ hi DiagnosticError ctermbg=12 ctermfg=NONE guibg=NONE guifg=#F24B42") ]] -- highlights for error
-- vim.cmd [[ hi DiagnosticWarn ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#FCA534") ]] -- highlights for warning
-- vim.cmd [[ hi DiagnosticInfo ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#AEFA47") ]] -- highlights for info
-- vim.cmd [[ hi DiagnosticHint ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#14BC85") ]] -- highlight for hint in diagnostic

-- menu related highlights
-- vim.cmd([[ hi Pmenu guibg=NONE") ]]) -- auto-complete or any menu highlight
-- vim.cmd([[ hi PmenuSel guibg=#003440 guifg=#2aa097") ]]) -- highlight for the currently selected menu
-- -- vim.cmd [[ hi PmenuSbar guibg=#003440") ]] -- the scrollbar highlight
-- vim.cmd([[ hi PmenuThumb guibg=#003440") ]]) -- the thumb highlight in menu scrollbar

-- search and visual highlight
-- vim.cmd([[ hi Search guibg=#b16286 guifg=#bfbfbf ]]) -- highlight for the search term
-- vim.cmd([[ hi Visual guibg=#bfbfbf guifg=#686878 ]]) -- highlight for the code selection in visual mode
vim.cmd([[ hi Cursor guibg=#efefef guifg=#282C34 ]]) -- highlight for the cursor

vim.cmd([[ hi EndOfBuffer guifg=#003440 guibg=NONE ]])
-- vim.cmd([[ set fillchars+=eob:· list listchars+=trail:· ]])

local colors = require("sobo.plugins.diagnostics.message").colors
