local g = vim.g
local b = vim.b
local api = vim.api
local tbl_extend = vim.tbl_extend

g.mapleader = " " -- leader key globally
b.mapleader = " " -- leader key in buffer scope

local M = {} -- the export variable
g.total_mappings = 0 -- tracking count of mappings
g.maps = 0

-- main mapping function to create mapping in any mode...
M.map = function(mode, left, right, options)
	-- default value of the options
	local default_options = { noremap = true, silent = true }
	local local_options = default_options
	if options then
		local_options = tbl_extend("force", local_options, options)
	end

	-- both variables are equal just maps differ
	g.total_mappings = g.total_mappings + 1
	g.maps = g.maps + 1

	return api.nvim_set_keymap(mode, left, right, local_options)
end

local map = M.map

-- map("n", "<leader>r", ":so ~/.config/nvim/init.lua<CR>") -- reload all vim configs...
-- map("n", "<leader>e", ":e ~/.config/nvim/init.lua<CR>")  -- edit vim config...

map("n", "<leader>vs", ":vs<CR>", { desc = "Vertical split" })
map("n", "<leader>hs", ":split<CR>", { desc = "Horizontal split" })
map("n", "<leader>cs", ":close<CR>", { desc = "Close the current window" })

map("n", "<leader>tc", ":tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>tn", ":tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>to", ":tabnew %<CR>", { desc = "Open current buffer in new tab" })
map("n", "<leader>tp", ":tabprevious<CR>", { desc = "Go to previous tab" })
map("n", "<leader>tn", ":tabnext<CR>", { desc = "Go to next tab" })

map("n", "<C-s>", ":update<cr>") -- save the file
map("v", "<C-s>", "<c-c>:update<cr>")
map("i", "<C-s>", "<esc>:update<cr>gi")

-- Moving lines of text from one position to adjacent line position
map("v", "J", ":m '>+1<CR>gv=gv") -- move line down (visual mode)
map("v", "K", ":m '<-2<CR>gv=gv") -- move line up (visual mode)
map("i", "<C-j>", "<esc>:m .+1m<CR>==a") -- move line down (insert mode)
map("i", "<C-k>", "<esc>:m .-2m<CR>==a") -- move line up (insert mode)
map("n", "J", ":m .+1<CR>==") -- move line down (normal mode)
map("n", "K", ":m .-2<CR>==") -- move line up (normal mode)

map("v", ">", ">gv") -- re-highlight when the lines are indented manually
map("v", "<", "<gv") -- same as the above ones, but unindenting

-- Undo breakss throughout any code characters
map("i", "@", "@<c-g>u") -- undo breaks characters
map("i", "-", "-<c-g>u") -- undo breaks characters
map("i", "+", "+<c-g>u") -- undo breaks characters
map("i", ",", ",<c-g>u") -- undo breaks characters
map("i", ".", ".<c-g>u") -- undo breaks characters
map("i", "/", "/<c-g>u") -- undo breaks characters
map("i", ":", ":<c-g>u") -- undo breaks characters

-- -- mutation of Jumplist
map("n", "<expr> k", '(v:count > 5 ? "m\'" . v:count : "") . \'k\'')
map("n", "<expr> j", '(v:count > 5 ? "m\'" . v:count : "") . \'j\'')

-- -- keeping the current line at center when searching
map("n", "n", "nzzzv") -- searching helper
map("n", "N", "Nzzzv") -- searching helper
map("n", "*", "*zzzv") -- searching helper
map("n", "#", "#zzzv") -- searching helper

-- mappings for copy/paste purpose...
map("v", "y", '"+y') -- normal y should copy to the main system clipboard
map("n", "y", '"+yg') -- almost same as above
map("n", "yy", '"+yy') -- yy should do the same trick as above
map("n", "Y", '"+y$') -- capital y copy till end of the line
map("n", "p", '"+p') -- p will paste from the main system clipboard
map("n", "P", '"+P') -- same as above but with capital P or paste above the current line
map("v", "p", '"+p') -- same as above two ones but in visual mode
map("v", "P", '"+P') -- same as above two ones but in visual mode
map("v", "d", '"+x') -- d will cut the text and saves to system clipboard
map("n", "dd", 'V"+x') -- dd will cut the text to system clipboard
map("n", "D", 'v$h"+x') -- D will cut till the end of the line
map("n", "gy", "ggVG\"+y'y")
-- here h is used, so by deafult v$ also covers the end of the line character....
-- so to remove it from the visual selection we need to use v$h

-- word specific commands
map("n", "vv", "viw") -- select a word

-- silly
map("n", "<leader>q", ":q <CR>") -- quiting vim

-- navigation mappings like tmux <C-hjkl> to <C-w>hjkl
map("n", "<c-h>", "<c-w>h")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")

map("n", "<leader>k0", ":set foldlevel=0<CR>")
map("n", "<leader>k1", ":set foldlevel=1<CR>")
map("n", "<leader>k2", ":set foldlevel=2<CR>")
map("n", "<leader>k3", ":set foldlevel=3<CR>")
map("n", "<leader>k4", ":set foldlevel=4<CR>")
map("n", "<leader>k5", ":set foldlevel=5<CR>")
map("n", "<leader>k6", ":set foldlevel=6<CR>")
map("n", "<leader>k7", ":set foldlevel=7<CR>")
map("n", "<leader>k8", ":set foldlevel=8<CR>")
map("n", "<leader>k9", ":set foldlevel=99<CR>")

map("n", "<leader>+", "<C-a>", { desc = "Increment number" })
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

return M
