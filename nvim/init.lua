-- all the plugins config...
require("sobhanbera.plugins")
require("plugins.easymotion")
require("plugins.fugitive")
require("plugins.indent_blankline")
require("plugins.lsp")
require("plugins.lualine")
require("plugins.null_ls")
require("plugins.nvim_tree")
require("plugins.telescope")
require("plugins.treesitter")

USER = vim.fn.expand("$USER")
vim.cmd("source " .. "/Users/" .. USER .. "/.config/nvim/lua/config/markdown_preview.vim")
vim.cmd("source " .. "/Users/" .. USER .. "/.config/nvim/lua/plugins/lastplace.vim")
vim.cmd("source " .. "/Users/" .. USER .. "/.config/nvim/lua/plugins/maximizer.vim")

require("sobhanbera.mappings")
require("sobhanbera.utils")
require("sobhanbera.setters")
require("sobhanbera.ui")

-- require("sobhanbera.prints")
