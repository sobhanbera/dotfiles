return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/playground",
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			-- ensure_installed can be "all" or a list of languages { "python", "javascript" }
			-- ensure_installed = {"python", "bash", "javascript", "clojure", "go"},
			ensure_installed = {
				"javascript",
				"typescript",
				"go",
				"bash",
				"c",
				"cpp",
				"java",
				"html",
				"css",
				"scss",
				"json",
				"rust",
				"comment",
				"python",
				"prisma",
				"regex",

				"lua",
				"vim",
				"luadoc",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
			},
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			autotag = {
				enable = true,
			},
			indent = { enable = true },
			sync_install = false,
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				disable = function(lang, buf)
					local max_filesize = 200 * 1024 -- 200 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})

		require("ts_context_commentstring").setup({
			enable_autocmd = false,
			languages = {
				typescript = "// %s",
			},
		})
		-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
		-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

		local map = require("sobo.core.keymaps").map
		map("n", "<leader>p", ":TSPlaygroundToggle<CR>")

		require("treesitter-context").setup({
			enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
			max_lines = 2, -- How many lines the window should span. Values <= 0 mean no limit.
			min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
			line_numbers = true,
			multiline_threshold = 20, -- Maximum number of lines to show for a single context
			trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
			mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
			-- Separator between context and content. Should be a single character string, like '-'.
			-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
			separator = nil,
			zindex = 20, -- The Z-index of the context window
			on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
		})
		vim.cmd("TSContextEnable")
	end,
}
