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
