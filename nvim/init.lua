require("sobo.core.keymaps")
require("sobo.core.settings")
require("sobo.lazy")
require("sobo.core.interface") -- again just to get the transparent background

USER = vim.fn.expand("$USER")
vim.cmd("source " .. "/Users/" .. USER .. "/.config/nvim/lua/sobo/vim/markdown_preview.vim")
vim.cmd("source " .. "/Users/" .. USER .. "/.config/nvim/lua/sobo/vim/maximizer.vim")
vim.cmd("source " .. "/Users/" .. USER .. "/.config/nvim/lua/sobo/vim/lastplace.vim")
