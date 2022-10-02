-- +-----------------------------------------------------+
-- |                    NULL-LS CONFIG                   |
-- +-----------------------------------------------------+
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

null_ls.setup({
	debug = false,
	sources = {
		-- formatting.prettier.with({
			-- 	extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		-- }),
		formatting.prettier, -- without any extra args the formatting is very fast like instantly without any pauses
		formatting.black.with({
			extra_args = { "--fast" },
		}),
		formatting.stylua,
	},
})

-- auto format files

local map = require("sobhanbera.mappings").map
map("n", "<leader>df", ":lua vim.lsp.buf.formatting()<CR>")
map("n", "df", ":lua vim.lsp.buf.formatting()<CR>")

-- local event = "BufWritePost"
-- local filetypes = "*.js,*.ts,*.tsx,*.jsx,*.css,*.scss,*.lua"
-- local formattingCommand = "lua vim.lsp.buf.formatting_seq_sync()"
-- vim.cmd("autocmd " .. event .. " " .. filetypes .. " " .. formattingCommand) -- formmating a file when saved
-- print("autocmd " .. event .. " " .. filetypes .. " " .. formattingCommand)
