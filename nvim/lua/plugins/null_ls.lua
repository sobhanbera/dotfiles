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
		formatting.ktlint,
		formatting.prettier, -- without any extra args the formatting is very fast like instantly without any pauses
		formatting.black.with({
			extra_args = { "--fast" },
		}),
		formatting.stylua,
		formatting.clang_format,
	},
})

-- formatting key-bindings here
local map = require("sobhanbera.mappings").map
map("n", "<leader>df", ":lua vim.lsp.buf.format()<CR>")
map("n", "df", ":lua vim.lsp.buf.format{ async = true }<CR>")

local event = "BufWritePost"
local filetypes = "*.cpp,*.c,*.js,*.jsx,*.kt,*.kts,*.json,*.ts,*.tsx,*.css,*.scss,*.lua,*.rs"
local formattingCommand = "lua vim.lsp.buf.format({ timeout = 2000 })"

-- auto format files
vim.cmd(
	-- "autocmd BufWritePost *.cpp,*.c,*.js,*.jsx,*.kt,*.kts,*.json,*.ts,*.tsx,*.css,*.scss,*.lua,*.rs lua vim.lsp.buf.format({ timeout = 2000 })"
	"autocmd " .. event .. " " .. filetypes .. " " .. formattingCommand
)

-- local event = "BufWritePost"
-- local filetypes = "*.js,*.ts,*.tsx,*.jsx,*.css,*.scss,*.lua"
-- local formattingCommand = "lua vim.lsp.buf.formatting_seq_sync()"
-- vim.cmd("autocmd " .. event .. " " .. filetypes .. " " .. formattingCommand) -- formmating a file when saved
-- print("autocmd " .. event .. " " .. filetypes .. " " .. formattingCommand)
