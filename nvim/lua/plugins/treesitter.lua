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
	sync_install = true,
	highlight = {
		enable = true,
	},
	-- incremental_selection = {
	-- 	enable = true, -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
	-- 	-- disable = { "cpp", "lua" },
	-- 	keymaps = {
	-- 		-- mappings for incremental selection (visual mappings)
	-- 		init_selection = "gnn", -- maps in normal mode to init the node/scope selection
	-- 		node_incremental = "grn", -- increment to the upper named parent
	-- 		scope_incremental = "grc", -- increment to the upper scope (as defined in locals.scm)
	-- 		node_decremental = "grm", -- decrement to the previous node
	-- 	},
	-- },
	-- indent = {
	-- 	enable = true,
	-- },
	-- textobjects = {
	-- 	-- These are provided by
	-- 	select = {
	-- 		enable = true, -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
	-- 		keymaps = {
	-- 			-- You can use the capture groups defined here:
	-- 			-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects/blob/master/queries/c/textobjects.scm
	-- 			["af"] = "@function.outer",
	-- 			["if"] = "@function.inner",
	-- 			["ab"] = "@block.outer",
	-- 			["ib"] = "@block.inner",
	-- 			["as"] = "@statement.outer",
	-- 			["is"] = "@statement.inner",
	-- 		},
	-- 	},
	-- },
})
