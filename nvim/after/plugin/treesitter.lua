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
	},
	indent = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		config = {
			javascript = {
				__default = "// %s",
				jsx_element = "{/* %s */}",
				jsx_fragment = "{/* %s */}",
				jsx_attribute = "// %s",
				comment = "// %s",
			},
			typescript = {
				__default = "// %s",
				__multiline = "/* %s */",
				jsx_element = "{/* %s */}",
				jsx_fragment = "{/* %s */}",
				jsx_attribute = "// %s",
				comment = "// %s",
			},
		},
		enable_autocmd = false,
	},
})

-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

require("Comment").setup({
	pre_hook = function(ctx)
		local U = require("Comment.utils")

		local location = nil
		if ctx.ctype == U.ctype.block then
			location = require("ts_context_commentstring.utils").get_cursor_location()
		elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
			location = require("ts_context_commentstring.utils").get_visual_start_location()
		end

		return require("ts_context_commentstring.internal").calculate_commentstring({
			key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
			location = location,
		})
	end,
})
