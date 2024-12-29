USER = vim.fn.expand("$USER")

-- all the plugins config...
-- require("sobhanbera.plugins")
vim.cmd("source " .. "/Users/" .. USER .. "/.config/nvim/lua/sobhanbera/plugins.vim")

--
require("plugins.alpha")
require("plugins.bufferline")
require("plugins.colorscheme")
require("plugins.comment")
-- require("plugins.copilot")
-- require("plugins.cursorword")
require("plugins.easymotion")
require("plugins.fugitive")
require("plugins.gitgutter")
require("plugins.indent_blankline")
require("plugins.lsp")
require("plugins.lualine")
require("plugins.luasnip")
require("plugins.null_ls")
require("plugins.nvim_tree")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.trouble")
require("plugins.undotree")

vim.cmd("source " .. "/Users/" .. USER .. "/.config/nvim/lua/config/markdown_preview.vim")
vim.cmd("source " .. "/Users/" .. USER .. "/.config/nvim/lua/plugins/lastplace.vim")
vim.cmd("source " .. "/Users/" .. USER .. "/.config/nvim/lua/plugins/maximizer.vim")

require("sobhanbera.mappings")
require("sobhanbera.utils")
require("sobhanbera.setters")
require("sobhanbera.ui")

-- require("sobhanbera.prints")
