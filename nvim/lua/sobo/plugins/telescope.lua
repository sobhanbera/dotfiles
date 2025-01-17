return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"jose-elias-alvarez/null-ls.nvim",
		"dense-analysis/ale",
	},
	config = function()
		-- +-----------------------------------------------------+
		-- |                    TELESCOPE CONFIG                 |
		-- +-----------------------------------------------------+
		local telescope = require("telescope")
		local previewers = require("telescope.previewers")
		local actions = require("telescope.actions")
		local action_layout = require("telescope.actions.layout")

		-- limiting preview window on large files
		-- for now it is 50.00 KB
		local new_maker = function(filepath, bufnr, opts)
			opts = opts or {}

			filepath = vim.fn.expand(filepath)
			vim.loop.fs_stat(filepath, function(_, stat)
				if not stat then
					return
				end
				if stat.size > 51200 then
					return
				else
					previewers.buffer_previewer_maker(filepath, bufnr, opts)
				end
			end)
		end

		telescope.setup({
			defaults = {
				file_sorter = require("telescope.sorters").get_fzy_sorter,
				prompt_prefix = "🔍 ",
				color_devicons = true,
				previewer = false,
				buffer_previewer_maker = new_maker,

				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

				theme = "get_ivy",
				mappings = {
					i = {
						["<C-x>"] = false,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["?"] = action_layout.toggle_preview,
					},
				},

				-- ignore files
				file_ignore_patterns = { "node_modules", "package-lock.json", "plugged", "langserver" },
			},
		})

		-- NULL LS CONFIG
		-- local null_ls = require("null-ls")
		-- local formatting = null_ls.builtins.formatting

		-- null_ls.setup({
		--   debug = false,
		--   sources = {
		--     -- formatting.prettier.with({
		--     -- 	extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		--     -- }),
		--     formatting.ktlint,
		--     formatting.prettier, -- without any extra args the formatting is very fast like instantly without any pauses
		--     -- formatting.black.with({
		--     -- 	extra_args = { "--fast" },
		--     -- }),
		--     formatting.stylua,
		--     formatting.clang_format,
		--   },
		-- })

		-- -- formatting key-bindings here
		-- map("n", "<leader>df", ":lua vim.lsp.buf.format()<CR>")
		-- map("n", "df", ":lua vim.lsp.buf.format{ async = true }<CR>")

		-- local event = "BufWritePost"
		-- local filetypes = "*.cpp,*.c,*.js,*.jsx,*.kt,*.kts,*.json,*.ts,*.tsx,*.css,*.scss,*.lua,*.rs"
		-- local formattingCommand = "lua vim.lsp.buf.format({ timeout = 2000 })"

		-- auto format files
		-- vim.cmd(
		-- 	-- "autocmd BufWritePost *.cpp,*.c,*.js,*.jsx,*.kt,*.kts,*.json,*.ts,*.tsx,*.css,*.scss,*.lua,*.rs lua vim.lsp.buf.format({ timeout = 2000 })"
		-- 	"autocmd " .. event .. " " .. filetypes .. " " .. formattingCommand
		-- )

		-- local event = "BufWritePost"
		-- local filetypes = "*.js,*.ts,*.tsx,*.jsx,*.css,*.scss,*.lua"
		-- local formattingCommand = "lua vim.lsp.buf.formatting_seq_sync()"
		-- vim.cmd("autocmd " .. event .. " " .. filetypes .. " " .. formattingCommand) -- formmating a file when saved
		-- print("autocmd " .. event .. " " .. filetypes .. " " .. formattingCommand)
	end,
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files(
					require("telescope.themes").get_ivy({ prompt_title = "< Search Files >", previewer = false })
				)
			end,
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").git_files(
					require("telescope.themes").get_ivy({ prompt_title = "< Project Files >", previewer = false })
				)
			end,
			desc = "Find git files",
		},
		{
			"<leader>fa",
			function()
				require("telescope.builtin").oldfiles(
					require("telescope.themes").get_ivy({ prompt_title = "< Recently Opened >", previewer = false })
				)
			end,
			desc = "Find recently opened files",
		},
		{
			"<leader>gr",
			function()
				require("telescope.builtin").live_grep(
					require("telescope.themes").get_ivy({ prompt_title = "< Search code >" })
				)
			end,
			desc = "Find any text throughout the codebase",
		},
		{
			"<leader>bf",
			function()
				require("telescope.builtin").buffers(
					require("telescope.themes").get_ivy({ prompt_title = "< Search Buffers >", previewer = false })
				)
			end,
			desc = "Find buffer",
		},
		{
			"<leader>ft",
			function()
				require("telescope.builtin").grep_string(
					require("telescope.themes").get_ivy({ prompt_title = "< Search Todos >", previewer = false })
				)
			end,
			desc = "Find todos",
		},
	},
}
