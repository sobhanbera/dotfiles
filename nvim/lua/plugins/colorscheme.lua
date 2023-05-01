-- +-----------------------------------------------------+
-- |                COLORSCHEME SETUP					 |
-- +-----------------------------------------------------+
require("github-theme").setup({
	comment_style = "NONE",
	keyword_style = "NONE",
	function_style = "NONE",
	variable_style = "NONE",
	msg_area_style = "NONE",
	theme_style = "dark_default",
	sidebars = { "qf", "vista_kind", "terminal", "packer" },

	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	colors = { hint = "orange", error = "red" },

	-- Overwrite the highlight groups
	overrides = function(c)
		return {
			htmlTag = {
				fg = c.red,
				bg = "",
				sp = c.hint,
				-- style = ""
			},

			-- this is the diagnostic part of the syntax highlight
			DiagnosticHint = {
				link = "LspDiagnosticsDefaultHint",
			},

			-- this will remove the highlight groups
			TSField = {},

			-- styling the comments in the code
			Comment = {
				fg = "#bfbfcf",
			},
		}
	end,
})

require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true,
	show_end_of_buffer = true, -- show the '~' characters after the end of buffers
	term_colors = true,
	dim_inactive = {
		enabled = true,
		shade = "dark",
		percentage = 0.15,
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		notify = false,
		mini = false,
		bufferline = true,
		lualine = true,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})
