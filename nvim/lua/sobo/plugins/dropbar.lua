return {
	-- {
	-- 	"Bekaboo/dropbar.nvim",
	-- 	lazy = false,
	-- 	dependencies = {
	-- 		"nvim-telescope/telescope-fzf-native.nvim",
	-- 		build = "make",
	-- 	},
	-- 	config = function()
	-- 		-- local diagnosticMessage = require("sobo.plugins.diagnostics.message")
	-- 		-- local colors = diagnosticMessage.colors

	-- 		local dropbar_api = require("dropbar.api")

	-- 		vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
	-- 		vim.keymap.set("n", ";[", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
	-- 		vim.keymap.set("n", ";]", dropbar_api.select_next_context, { desc = "Select next context" })

	-- 		-- vim.cmd("hi DropBarMenuThumb guifg=" .. colors.darkgray .. " guibg=" .. colors.black)
	-- 		-- vim.cmd("hi DropBarMenuCurrentContext guifg=" .. colors.blue .. " guibg=" .. colors.blueDimmed)
	-- 		-- vim.cmd("hi DropBarMenuHoverEntry guifg=" .. colors.gray .. " guibg=" .. colors.darkgray)
	-- 	end,
	-- },
}
