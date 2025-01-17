return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- enable the statusline
		statuscolumn = {
			enabled = true,
			left = { "mark", "sign", "fold" }, -- "sign"
			right = { "git" },
			folds = {
				open = true, -- show open fold icons
				git_hl = true, -- use Git Signs hl for fold icons
			},
			git = {
				patterns = { "GitSign", "MiniDiffSign" },
			},
			refresh = 50,
		},

		-- enable the indent guides
		indent = {
			enabled = true,
			animate = {
				enabled = false, -- vim.fn.has("nvim-0.10") == 1,
				style = "out",
				easing = "linear",
				duration = {
					step = 20, -- ms per step
					total = 500, -- maximum duration
				},
			},
		},

		-- all the other
		bigfile = { enabled = true },
		dashboard = { enabled = false },
		input = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scroll = { enabled = true },
		words = { enabled = true },
		git = { enabled = true },
	},
}
