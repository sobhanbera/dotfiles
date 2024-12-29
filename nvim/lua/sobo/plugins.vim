"" """"""""""""""""""""""""""""" ""
""            Plugins            ""
"" """"""""""""""""""""""""""""" ""
call plug#begin()

" LSP PLUGINS & AUTOCOMPLETE
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" auto-completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'           " lsp completion
Plug 'hrsh7th/cmp-buffer'             " for buffer completion
Plug 'hrsh7th/cmp-path'               " for paths completion

" awesome signatures
Plug 'ray-x/lsp_signature.nvim'

" snippets and more
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'   " pre-configured snippets

" amazing fuzzy finder, and file formatter
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'folke/trouble.nvim'            " show trouble areas in the code
" not for formatting purpose which is this plugin made for but I use this plugin for declaration shower
" this plugin shows the description or type of any identifier in the status bar when hovered over any identifier or so
" so good plugin
Plug 'dense-analysis/ale'

" awesome syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/playground'

" language specific plugins
Plug 'rust-lang/rust.vim'             " rust integration
Plug 'simrat39/rust-tools.nvim'
Plug 'fatih/vim-go'                   " golang tool
Plug 'mxw/vim-jsx'
Plug 'udalov/kotlin-vim'

" user interface based plugins
Plug 'nvim-lualine/lualine.nvim'
Plug 'onsails/lspkind.nvim'           " auto complete menu icons
Plug 'nvim-tree/nvim-tree.lua'        " file explorer
Plug 'nvim-tree/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'				" OPTIONAL: for git status
Plug 'romgrk/barbar.nvim'
" Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'terryma/vim-multiple-cursors'
Plug 'yamatsum/nvim-cursorline'
Plug 'goolord/alpha-nvim'             " the core dashboard
" Plug 'anuvyklack/pretty-fold.nvim'	" pretty code fold
Plug 'kevinhwang91/promise-async'			" needed by the below folding plugin
Plug 'kevinhwang91/nvim-ufo'

" talking about UI, here are colorschemes
Plug 'projekt0n/github-nvim-theme'
Plug 'morhetz/gruvbox'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'ayu-theme/ayu-vim'
Plug 'navarasu/onedark.nvim'

" GIT & GITHUB & AI
Plug 'github/copilot.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" few utility plugins
Plug 'jiangmiao/auto-pairs'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'tpope/vim-surround'           " surround text objects
Plug 'machakann/vim-sandwich'       " surround text objects
Plug 'easymotion/vim-easymotion'    " makes existing motions more convenient
Plug 'psliwka/vim-smoothie'         " smooth scrolling and moving around
Plug 'mbbill/undotree'              " visual representation of the undo/history/file_change tree
Plug 'brenoprata10/nvim-highlight-colors'

" file commenting plugin
Plug 'numToStr/Comment.nvim'                          " commenting
Plug 'tpope/vim-commentary'                           " commenting
Plug 'suy/vim-context-commentstring'                  " context aware commenting
Plug 'JoosepAlviste/nvim-ts-context-commentstring'    " context aware commenting

" code time tracker
Plug 'wakatime/vim-wakatime'

call plug#end()
