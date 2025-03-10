return {
	"romgrk/barbar.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.g.barbar_auto_setup = false -- disable auto-setup

		require("barbar").setup({
			preset = "default",

			animation = true,
			auto_hide = false,

			tabpages = true,

			icons = {
				buffer_index = false,
				buffer_number = false,
				button = "",
				-- Enables / disables diagnostic symbols
				diagnostics = {
					[vim.diagnostic.severity.ERROR] = { enabled = false },
					[vim.diagnostic.severity.WARN] = { enabled = false },
					[vim.diagnostic.severity.INFO] = { enabled = false },
					[vim.diagnostic.severity.HINT] = { enabled = false, icon = " " },
				},
				gitsigns = {
					added = { enabled = false, icon = "+" },
					deleted = { enabled = false, icon = "-" },
					changed = { enabled = false, icon = "~" },
				},
				filetype = {
					custom_colors = false,
					enabled = true,
				},
				separator = { left = "▎", right = "" },
				modified = { button = "●" },
				pinned = { button = "", filename = true },
			},
			-- Set the filetypes which barbar will offset itself for
			sidebar_filetypes = {
				-- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
				NvimTree = true,
				-- Or, specify the text used for the offset:
				undotree = {
					text = "undotree",
					align = "left", -- *optionally* specify an alignment (either 'left', 'center', or 'right')
				},
				-- Or, specify the event which the sidebar executes when leaving:
				-- ['neo-tree'] = {event = 'BufWipeout'},
				-- Or, specify all three
				-- Outline = {event = 'BufWinLeave', text = 'symbols-outline', align = 'right'},
			},
		})

		local map = require("sobo.core.keymaps").map
		-- Move to previous/next
		map("n", "<C-t>", "<Esc>:BufferNext<CR>")
		map("n", "<C-y>", "<Esc>:BufferPrevious<CR>")

		-- Re-order to previous/next
		map("n", "<C-S-t>", "<Esc>:BufferMoveNext<CR>")
		map("n", "<C-S-y>", "<Esc>:BufferMovePrevious<CR>")

		-- Pin/Unpin
		map("n", "<leader>tp", "<Cmd>BufferPin<CR>", opts)

		-- Close
		map("n", "<leader>bd", "<Cmd>BufferClose<CR>", opts)

		vim.cmd([[ hi BufferTabpageFill guibg=NONE guifg=NONE gui=NONE ]])
		-- vim.cmd("highlight BufferCurrent guibg=" .. colors.white .. " guifg=" .. colors.black)
	end,
}
