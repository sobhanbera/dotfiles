require("sobhanbera.mappings")
require("sobhanbera.utils")
require("sobhanbera.plugins")
require("sobhanbera.setters")
require("sobhanbera.ui")
require("sobhanbera.prints")

USER = vim.fn.expand("$USER")
vim.cmd("source " .. "/Users/" .. USER .. "/.config/nvim/lua/config/markdown_preview.vim")
vim.cmd("source " .. "/Users/" .. USER .. "/.config/nvim/lua/plugins/lastplace.vim")
vim.cmd("source " .. "/Users/" .. USER .. "/.config/nvim/lua/plugins/maximizer.vim")

