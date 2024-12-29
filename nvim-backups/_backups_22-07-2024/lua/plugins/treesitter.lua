-- +-----------------------------------------------------+
-- |                   TREESITTER CONFIGS                |
-- +-----------------------------------------------------+

require("nvim-treesitter.configs").setup({
	-- ensure_installed can be "all" or a list of languages { "python", "javascript" }
	-- ensure_installed = {"python", "bash", "javascript", "clojure", "go"},
	ensure_installed = {
		"javascript",
		"typescript",
		"kotlin",
		"go",
		"bash",
		"c",
		"cpp",
		"java",
		"css",
		"html",
		"json",
		"lua",
		"scss",
		"svelte",
		"r",
		"rust",
		"vim",
		"regex",
		"comment",
		"python",
		"prisma",
	},
	highlight = {
		enable = true,
		disable = { "html" },
	},
	indent = {
		enable = true,
	},

	context_commentstring = {
		enable = true,
	},
})
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

local map = require("sobhanbera.mappings").map
map("n", "<leader>p", ":TSPlaygroundToggle<CR>")
