-- +-----------------------------------------------------+
-- |                   TREESITTER CONFIGS                |
-- +-----------------------------------------------------+

require("nvim-treesitter.configs").setup({
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
		"css",
		"html",
		"json",
		"lua",
		"scss",
		"r",
		"vim",
		"regex",
		"comment",
		"python",
	},
	highlight = {
		enable = true,
		disable = { "html" },
	},
	indent = {
		enable = true,
	},
})
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
