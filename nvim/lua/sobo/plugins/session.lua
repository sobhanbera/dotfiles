return {
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		config = function()
			require("persistence").setup({
				dir = vim.fn.stdpath("state") .. "/sessions/",
				need = 0, -- Set to 0 to always save, else set to 1
				branch = true, -- use git branch to save session
				options = {
					"globals",
				},
				pre_save = function()
					vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
				end,
			})

			-- vim.api.nvim_create_autocmd("VimEnter", {
			-- 	-- group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
			-- 	callback = function()
			-- 		if vim.fn.getcwd() ~= vim.env.HOME then
			-- 			require("persistence").load()
			-- 		end
			-- 	end,
			-- 	nested = true,
			-- })
		end,
		keys = {
			{
				"<leader>ls",
				function()
					require("persistence").load()
				end,
				desc = "Load last session",
			},
		},
	},
}
