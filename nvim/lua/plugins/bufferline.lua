require("bufferline").setup({
	options = {
		numbers = "none",
		-- number_style = "superscript",
		close_command = "bdelete! %d",
		right_mouse_command = "bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		-- indicator = {
		-- 	style = {
		-- 		icon = "▎",
		-- 	},
		-- },
		-- indicator_icon = "▎",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		name_formatter = function(buf)
			if buf.name:match("%.md") then
				return vim.fn.fnamemodify(buf.name, ":t:r")
			end
		end,
		max_name_length = 45,
		max_prefix_length = 30,
		tab_size = 24,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "(" .. count .. ")"
		end,
		custom_filter = function(buf_number)
			if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
				return true
			end
			if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
				return true
			end
			if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
				return true
			end
		end,
		offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "left" } },
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		persist_buffer_sort = true,
		separator_style = "thin",
		enforce_regular_tabs = true,
		always_show_bufferline = false,
		sort_by = "relative_directory",
		custom_areas = {},
	},
})

local map = require("sobhanbera.mappings").map
-- Move to previous/next
map("n", "<C-t>", "<Esc>:BufferLineCycleNext<CR>")
map("n", "<C-S-t>", "<Esc>:BufferLineCyclePrev<CR>")

-- Re-order to previous/next
map("n", "<C-S-up>", ":BufferLineMoveNext<CR>")
map("n", "<C-S-down>", ":BufferLineMovePrev<CR>")

-- -- Goto buffer in position...
-- map("n", "<F1>", ":BufferLineGoToBuffer 1<CR>")
-- map("n", "<F2>", ":BufferLineGoToBuffer 2<CR>")
-- map("n", "<F3>", ":BufferLineGoToBuffer 3<CR>")
-- map("n", "<F4>", ":BufferLineGoToBuffer 4<CR>")
-- map("n", "<F5>", ":BufferLineGoToBuffer 5<CR>")
