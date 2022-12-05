-- +-----------------------------------------------------+
-- |                    TELESCOPE CONFIG                 |
-- +-----------------------------------------------------+
local telescope = require("telescope")
local previewers = require("telescope.previewers")
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

-- limiting preview window on large files
-- for now it is 50.00 KB
local new_maker = function(filepath, bufnr, opts)
	opts = opts or {}

	filepath = vim.fn.expand(filepath)
	vim.loop.fs_stat(filepath, function(_, stat)
		if not stat then
			return
		end
		if stat.size > 51200 then
			return
		else
			previewers.buffer_previewer_maker(filepath, bufnr, opts)
		end
	end)
end

telescope.setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = "🔍 ",
		color_devicons = true,
		previewer = false,
		buffer_previewer_maker = new_maker,

		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

		theme = "get_dropdown",
		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["?"] = action_layout.toggle_preview,
			},
		},

		-- ignore files
		file_ignore_patterns = { "node_modules", "package-lock.json", "plugged", "langserver" },
	},
})

local map = require('sobhanbera.mappings').map
map(
	"n",
	"<leader>ff",
	"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ prompt_title = '< Search Files >' }))<cr>"
) -- find any file
map(
	"n",
	"<leader>fj",
	"<cmd>lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown({ prompt_title = '< Project Files >' }))<CR>"
) -- git files
map(
	"n",
	"<leader>fa",
	"<cmd>lua require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown({ prompt_title = '< Recently Opened >' }))<cr>"
) -- find buffer
map(
	"n",
	"<leader>gr",
	"<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown({ prompt_title = '< Search code >' }))<cr>"
) -- find any text throughout the codebase
map(
	"n",
	"<leader>bf",
	"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({ prompt_title = '< Search Buffers >' }))<cr>"
) -- find buffer
