return {
  {
    "github/copilot.vim"
  },

  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = true
  },

  {
    'tpope/vim-fugitive',
    dependencies = {
      'airblade/vim-gitgutter'
    },
  },

  {
    'lewis6991/gitsigns.nvim',
    enabled = true,
    config = function()
      local gitsigs = require("gitsigns")
      gitsigs.setup({
        signs = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "┃" },
          topdelete = { text = "┃" },
          changedelete = { text = "┃" },
          untracked = { text = "┆" },
        },
        signs_staged = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "┃" },
          topdelete = { text = "┃" },
          changedelete = { text = "┃" },
          untracked = { text = "┆" },
        },
        signs_staged_enable = true,
      })

      vim.cmd([[ Gitsigns toggle_current_line_blame ]])
    end
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>git", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
    },
  }
}
