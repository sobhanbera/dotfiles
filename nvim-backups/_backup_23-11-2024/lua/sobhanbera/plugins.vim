" +-----------------------------------------------------+
" |                        PLUGINS                      |
" +-----------------------------------------------------+
call plug#begin()

" +-----------------------------------------------------+
" |             LSP PLUGINS & AUTOCOMPLETE              |
" +-----------------------------------------------------+
" NVIM LSP CONFIG

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" the exact completion plugin, since nvim-compe is deprecated
Plug 'hrsh7th/nvim-cmp'
" lsp completion
Plug 'hrsh7th/cmp-nvim-lsp'
" for buffer completion
Plug 'hrsh7th/cmp-buffer'
" for paths completion
Plug 'hrsh7th/cmp-path'
" snippets
Plug 'L3MON4D3/LuaSnip'
" snippets related stuffs
Plug 'saadparwaiz1/cmp_luasnip'
" snippets related stuffs
Plug 'rafamadriz/friendly-snippets'
" for rust integration
Plug 'rust-lang/rust.vim'
" rust tools
Plug 'simrat39/rust-tools.nvim'
" golang tool
Plug 'fatih/vim-go'
" highly extendable fuzzy finder
Plug 'nvim-telescope/telescope.nvim'
" plenary
Plug 'nvim-lua/plenary.nvim'
" null.ls is common you know right
Plug 'jose-elias-alvarez/null-ls.nvim'
" awesome syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/playground'
" mainly for function signatures
Plug 'ray-x/lsp_signature.nvim'
" statusbar structure update ui
Plug 'nvim-lualine/lualine.nvim'
" auto complete menu icons
Plug 'onsails/lspkind.nvim'
" not for formatting purpose which is this plugin made for but I use this plugin for declaration shower
" this plugin shows the description or type of any identifier in the state bar when hovered over any identifier or so
" so good plugin
Plug 'dense-analysis/ale'
" show trouble areas in the code
Plug 'folke/trouble.nvim'

" +-----------------------------------------------------+ "
" |                    GIT & GITHUB                     |
" +-----------------------------------------------------+ "
" The Github Copilot
Plug 'github/copilot.vim'
" git useful plugins
Plug 'tpope/vim-fugitive'
" shows gutters for git
Plug 'airblade/vim-gitgutter'

" +-----------------------------------------------------+ "
" |             SYNTAX, COLORS AND SCHEMES              |
" +-----------------------------------------------------+ "
" github default colorscheme
" Plug 'projekt0n/github-nvim-theme'
" for colorscheme
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'

" +-----------------------------------------------------+ "
" |                   USER INTERFACE					 |
" +-----------------------------------------------------+ "
" file explorer
" Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-tree/nvim-tree.lua'

" required for tab plugin
" Plug 'kyazdani42/nvim-web-devicons'
 " Recommended (for coloured icons)
Plug 'nvim-tree/nvim-web-devicons'
" for those brilliant tabs
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
" indentation for blank lines
Plug 'lukas-reineke/indent-blankline.nvim'
" CTRL + N for multiple cursors
Plug 'terryma/vim-multiple-cursors'
" to highlight the word at cursor
Plug 'yamatsum/nvim-cursorline'
" the dashboard
" require("alpha").setup(require("alpha.themes.startify").config)
Plug 'goolord/alpha-nvim'
" code folding
Plug 'anuvyklack/pretty-fold.nvim'

" +-----------------------------------------------------+
" |                 UTILS COMPONENTS                    |
" +-----------------------------------------------------+
" just want to do it manually
Plug 'jiangmiao/auto-pairs'
" plugin to preview markdown code
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
" Surrounding ysw)
Plug 'tpope/vim-surround'
" vim also makes sandwiches
Plug 'machakann/vim-sandwich'
" n and N was not working add this or remove the easymotion.vim plugin file. actually this plugin contains a map with n/N remove them so that you could navigate easily
Plug 'easymotion/vim-easymotion'
" smooth vim movements
Plug 'psliwka/vim-smoothie'
" for undoing and redoing record of days and days
Plug 'mbbill/undotree'

" +-----------------------------------------------------+
" |                 LANGUAGE SPECIFIC                   |
" +-----------------------------------------------------+
" vim jsx differentiator
Plug 'mxw/vim-jsx'
" vim comment link helper
Plug 'numToStr/Comment.nvim'
" vim commentor
Plug 'tpope/vim-commentary'
" comments based on position of cursor, and context
Plug 'suy/vim-context-commentstring'
" comments for different context
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
" vim for kotlin
Plug 'udalov/kotlin-vim'

" +-----------------------------------------------------+
" |                        DEVOPs                       |
" +-----------------------------------------------------+
" wakatime a developer statistics provider
Plug 'wakatime/vim-wakatime'

call plug#end()
