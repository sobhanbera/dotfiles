-- +-----------------------------------------------------+
-- |                        PLUGINS                      |
-- +-----------------------------------------------------+
local packer = require('packer')
return require('packer').startup {
    function(use)
        -- +-----------------------------------------------------+ "
        -- |                   PACKER ITSELF                     |
        -- +-----------------------------------------------------+ "
        use 'wbthomason/packer.nvim'

        -- +-----------------------------------------------------+ "
        -- |             LSP PLUGINS & AUTOCOMPLETE              |
        -- +-----------------------------------------------------+ "
        -- NVIM LSP CONFIG
        use "neovim/nvim-lspconfig"
        -- the exact completion plugin, since nvim-compe is deprecated
        use "hrsh7th/nvim-cmp"
        -- lsp completion
        use "hrsh7th/cmp-nvim-lsp"
        -- for buffer completion
        use "hrsh7th/cmp-buffer"
        -- for paths completion
        use "hrsh7th/cmp-path"
        -- snippets
        use "L3MON4D3/LuaSnip"
        -- snippets related stuffs
        use "saadparwaiz1/cmp_luasnip"
        -- snippets related stuffs
        use "rafamadriz/friendly-snippets"
        -- for rust integration
        use "rust-lang/rust.vim"
        -- rust tools
        use "simrat39/rust-tools.nvim"
        -- highly extendable fuzzy finder
        use "nvim-telescope/telescope.nvim"
        -- plenary
        use "nvim-lua/plenary.nvim"
        -- null.ls is common you know right
        use "jose-elias-alvarez/null-ls.nvim"
        -- awesome syntax
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }
        -- mainly for function signatures
        use "ray-x/lsp_signature.nvim"
        -- statusbar structure update ui
        use "nvim-lualine/lualine.nvim"
        -- auto complete menu icons
        use "onsails/lspkind.nvim"
        -- not for formatting purpose which is this plugin made for but I use this plugin for declaration shower
        -- this plugin shows the description or type of any identifier in the state bar when hovered over any identifier or so
        -- so good plugin
        use "dense-analysis/ale"

        -- +-----------------------------------------------------+ "
        -- |                    GIT & GITHUB                     |
        -- +-----------------------------------------------------+ "
        -- The Github Copilot
        use "github/copilot.vim"
        -- git useful plugins
        use "tpope/vim-fugitive"
        -- shows gutters for git
        use "airblade/vim-gitgutter"

        -- +-----------------------------------------------------+ "
        -- |             SYNTAX, COLORS AND SCHEMES              |
        -- +-----------------------------------------------------+ "
        -- github default colorscheme
        use "projekt0n/github-nvim-theme"
        -- ayu :)
        use "ayu-theme/ayu-vim"
        -- highlight where every color hash or code is found in the entire codebase or files
        use "lilydjwg/colorizer"
        -- theme, you need?
        use "sainnhe/sonokai"

        -- +-----------------------------------------------------+ "
        -- |                UI & UTILS COMPONENTS                |
        -- +-----------------------------------------------------+ "
        -- file explorer
        use "kyazdani42/nvim-tree.lua"
        -- required for tab plugin
        use "kyazdani42/nvim-web-devicons"
        -- Developer Icons seperate
        use "ryanoasis/vim-devicons"
        -- for those brilliant tabs
        use {
            'akinsho/bufferline.nvim',
            tag = "v3.*",
            requires = 'nvim-tree/nvim-web-devicons'
        }
        -- indentation for blank lines
        use "lukas-reineke/indent-blankline.nvim"
        -- just want to do it manually
        use "jiangmiao/auto-pairs"
        -- plugin to preview markdown code
        use ({
            "iamcco/markdown-preview.nvim",
            run = "cd app && yarn install",
            setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
            ft = { "markdown" },
        })
        -- CTRL + N for multiple cursors
        use "terryma/vim-multiple-cursors"
        -- Surrounding ysw)
        use "tpope/vim-surround"
        -- vim also makes sandwiches
        use "machakann/vim-sandwich"
        -- vim comment link helper
        use "numToStr/Comment.nvim"
        -- vim commentor
        use "tpope/vim-commentary"
        -- vim jsx differentiator
        use "mxw/vim-jsx"
        -- comments based on position of cursor, and context
        use "suy/vim-context-commentstring"
        -- n and N was not working add this or remove the easymotion.vim plugin file. actually this plugin contains a map with n/N remove them so that you could navigate easily
        use "easymotion/vim-easymotion"
        -- smooth vim movements
        use "psliwka/vim-smoothie"
        -- wakatime a developer statistics provider
        use "wakatime/vim-wakatime"

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
    end,
    config = {
        opt_default = false,
        display = {
            open_fn = require('packer.util').float, -- opens packer window in floating manner
            non_interactive = false, -- If true, disable display windows for all operations
            compact = false, -- If true, fold updates results by default
            open_cmd = '65vnew \\[packer\\]', -- An optional command to open a window for packer's display
            working_sym = '⟳', -- The symbol for a plugin being installed/updated
            error_sym = '✗', -- The symbol for a plugin with an error in installation/updating
            done_sym = '✓', -- The symbol for a plugin which has completed installation/updating
            removed_sym = '-', -- The symbol for an unused plugin which was removed
            moved_sym = '→', -- The symbol for a plugin which was moved (e.g. from opt to start)
            header_sym = '━', -- The symbol for the header line in packer's display
            show_all_info = true, -- Should packer show all update details automatically?
            prompt_border = 'double', -- Border style of prompt popups.
            keybindings = { -- Keybindings for the display window
                quit = 'q',
                toggle_update = 'u', -- only in preview
                continue = 'c', -- only in preview
                toggle_info = '<CR>',
                diff = 'd',
                prompt_revert = 'r',
            }
        },
        profile = {
            enable = false,
            threshold = 1, -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
        },
    }
}
