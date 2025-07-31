return {
	{
		"yetone/avante.nvim",
		build = "make BUILD_FROM_SOURCE=true",
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
		opts = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"echasnovski/mini.pick", -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua", -- for file_selector provider fzf
			"stevearc/dressing.nvim", -- for input provider dressing
			"folke/snacks.nvim", -- for input provider snacks
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			-- {
			-- 	-- support for image pasting
			-- 	"HakonHarnes/img-clip.nvim",
			-- 	event = "VeryLazy",
			-- 	opts = {
			-- 		-- recommended settings
			-- 		default = {
			-- 			embed_image_as_base64 = false,
			-- 			prompt_for_file_name = false,
			-- 			drag_and_drop = {
			-- 				insert_mode = true,
			-- 			},
			-- 		},
			-- 	},
			-- },
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},

		config = function()
			require("avante").setup({
				debug = false,
				mode = "agentic",
				provider = "openai",
				auto_suggestions_provider = "copilot",
				tokenizer = "tiktoken",

				windows = {
					position = "left",
					fillchars = "eob: ",
					wrap = true,
					width = 27,
					sidebar_header = {
						enabled = false,
						align = "center",
						rounded = true,
					},
					input = {
						prefix = ": ",
						height = 12, -- Height of the input window in vertical layout
					},
				},
			})
		end,
	},
}
