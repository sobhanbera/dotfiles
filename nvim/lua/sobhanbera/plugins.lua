-- +-----------------------------------------------------+
-- |                        PLUGINS                      |
-- +-----------------------------------------------------+
local Plug = vim.fn["plug#"] -- access vim plug...
vim.call("plug#begin", "~/.config/nvim/plugged")
-- +-----------------------------------------------------+ "
-- |           LSP PLUGINS & AUTOCOMPLETE                |
-- +-----------------------------------------------------+ "
Plug("neovim/nvim-lspconfig") -- NVIM LSP CONFIG

Plug("hrsh7th/nvim-cmp") -- the exact completion plugin, since nvim-compe is deprecated
Plug("hrsh7th/cmp-nvim-lsp") -- lsp completion
Plug("hrsh7th/cmp-buffer") -- for buffer completion
Plug("L3MON4D3/LuaSnip") -- snippets
Plug("saadparwaiz1/cmp_luasnip")
Plug("rafamadriz/friendly-snippets")

Plug("nvim-telescope/telescope.nvim") -- highly extendable fuzzy finder
Plug("nvim-lua/plenary.nvim")

Plug("jose-elias-alvarez/null-ls.nvim")
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" }) -- awesome syntax
Plug("ray-x/lsp_signature.nvim") -- mainly for function signatures
Plug("nvim-lualine/lualine.nvim") -- statusbar structure update ui
Plug("onsails/lspkind.nvim") -- auto complete menu icons
Plug("dense-analysis/ale") -- not for formatting purpose which is this plugin made for but I use this plugin for declaration shower
-- this plugin shows the description or type of any identifier in the state bar when hovered over any identifier or so
-- so good plugin

-- +-----------------------------------------------------+ "
-- |                    GIT & GITHUB                     |
-- +-----------------------------------------------------+ "
Plug("github/copilot.vim") -- The Github Copilot
Plug("tpope/vim-fugitive") -- git useful plugins
Plug("airblade/vim-gitgutter") -- shows gutters for git

-- +-----------------------------------------------------+ "
-- |            SYNTAX, COLORS AND SCHEMES               |
-- +-----------------------------------------------------+ "
Plug("ayu-theme/ayu-vim") -- ayu colorscheme
Plug("lilydjwg/colorizer") -- highlight where every color hash or code is found in the entire codebase or files
Plug("sainnhe/sonokai")

-- +-----------------------------------------------------+ "
-- |                UI & UTILS COMPONENTS                |
-- +-----------------------------------------------------+ "
Plug("kyazdani42/nvim-tree.lua") -- file explorer
Plug("kyazdani42/nvim-web-devicons") -- required for tab plugin
Plug("ryanoasis/vim-devicons") -- Developer Icons seperate
Plug("lukas-reineke/indent-blankline.nvim") -- indentation for blank lines
Plug("jiangmiao/auto-pairs") -- just want to do it manually
Plug("iamcco/markdown-preview.nvim", { ["do"] = "cd app && yarn install" }) -- plugin to preview markdown code
Plug("terryma/vim-multiple-cursors") -- CTRL + N for multiple cursors
Plug("tpope/vim-surround") -- Surrounding ysw)
Plug("machakann/vim-sandwich")
Plug("numToStr/Comment.nvim") -- vim comment link helper
Plug("easymotion/vim-easymotion") -- n and N was not working add this or remove the easymotion.vim plugin file. actually this plugin contains a map with n/N remove them so that you could navigate easily
Plug("psliwka/vim-smoothie") -- smooth vim movements
Plug("wakatime/vim-wakatime") -- wakatime a developer statistics provider
vim.call("plug#end")

-- all the plugins config...
require("plugins.easymotion")
require("plugins.fugitive")
require("plugins.indent_blankline")
require("plugins.lsp")
require("plugins.lualine")
require("plugins.null_ls")
require("plugins.nvim_tree")
require("plugins.telescope")
require("plugins.treesitter")
