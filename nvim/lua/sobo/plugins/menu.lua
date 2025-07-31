return {
	"xzbdmw/colorful-menu.nvim",
	config = function()
		require("colorful-menu").setup({
			ls = {
				lua_ls = {
					arguments_hl = "@comment",
				},
				ts_ls = {
					extra_info_hl = "@comment",
					align_type_to_right = true,
					preserve_type_when_truncate = true,
				},
				fallback = true,
				fallback_extra_info_hl = "@comment",
			},
			fallback_highlight = "@variable",
			max_width = 60,
		})
	end,
}
