require("bufferline").setup({
	options = {
		numbers = "none",
		-- number_style = "superscript",
		close_command = "bdelete! %d",
		right_mouse_command = "bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		indicator_icon = "▎",
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
		max_name_length = 35,
		max_prefix_length = 18,
		tab_size = 22,
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
map("n", "<A-d>", ":BufferLineCyclePrev<CR>")
map("n", "<A-f>", ":BufferLineCycleNext<CR>")

-- Re-order to previous/next
map("n", "<C-<>", ":BufferLineMovePrev<CR>")
map("n", "<C->>", ":BufferLineMoveNext<CR>")

-- -- Goto buffer in position...
map("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>")
map("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>")
map("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>")
map("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>")
map("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>")
map("n", "<A-6>", ":BufferLineGoToBuffer 6<CR>")
map("n", "<A-7>", ":BufferLineGoToBuffer 7<CR>")
map("n", "<A-8>", ":BufferLineGoToBuffer 8<CR>")
map("n", "<A-9>", ":BufferLineGoToBuffer 9<CR>")
