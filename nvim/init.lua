-- ----------------------------- --
--         Core Config           --
-- ----------------------------- --
USER = vim.fn.expand("$USER")
vim.cmd("source " .. "/Users/" .. USER .. "/.config/nvim/lua/sobo/plugins.vim")

require("configs.barbartabs")
require("configs.debug")
require("configs.easymotion")
require("configs.gitgithub")
require("configs.lsp")
require("configs.lualine")
require("configs.luasnip")
require("configs.null_ls")
require("configs.nvim_tree")
require("configs.telescope")
require("configs.treesitter")
require("configs.trouble")
require("configs.simple_plugins")
require("configs.ufo")

vim.cmd("source " .. "/Users/" .. USER .. "/.config/nvim/lua/configs/lastplace.vim")
vim.cmd("source " .. "/Users/" .. USER .. "/.config/nvim/lua/configs/markdown_preview.vim")
vim.cmd("source " .. "/Users/" .. USER .. "/.config/nvim/lua/configs/maximizer.vim")

require("sobo.colorscheme")
require("sobo.keymaps")
require("sobo.settings")
