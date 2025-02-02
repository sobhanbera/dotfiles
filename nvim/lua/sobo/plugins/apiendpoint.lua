return {
	"diepm/vim-rest-console",
	config = function()
		vim.g.vrc_set_default_mappings = 0
		vim.g.vrc_response_default_content_type = "application/json"
		vim.g.vrc_auto_format_response_patterns = {
			json = "jq",
		}

		vim.g.vrc_trigger = "<leader>re"
		vim.g.vrc_output_buffer_name = "_OUTPUT.json"
		vim.g.vrc_syntax_highlight_response = 1
		-- vim.g.rest_console_base_url = "http://localhost:4000"
		-- vim.g.vrc_elasticsearch_support = 1
	end,
	-- keys = {
	-- 	{
	-- 		"<leader>re",
	-- 		":call VrcQuery()<CR>",
	-- 		{ desc = "Run the rest request query" },
	-- 	},
	-- },
}
