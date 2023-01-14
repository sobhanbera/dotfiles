-- +-----------------------------------------------------+
-- |                    NVIM MAPPINGS                    |
-- +-----------------------------------------------------+
vim.g.mapleader = " " -- leader key globally
vim.b.mapleader = " " -- leader key in buffer scope

local M = {} -- the export variable
vim.g.total_mappings = 0 -- tracking count of mappings
vim.g.maps = 0

-- main mapping function to create mapping in any mode...
M.map = function(mode, left, right, options)
	-- default value of the options
	local default_options = { noremap = true, silent = true }
	local local_options = default_options
	if options then
		local_options = vim.tbl_extend("force", local_options, options)
	end

	-- both variables are equal just maps differ
	vim.g.total_mappings = vim.g.total_mappings + 1
	vim.g.maps = vim.g.maps + 1

	return vim.api.nvim_set_keymap(mode, left, right, local_options)
end
local map = M.map

map("n", "<leader>s", ":so ~/.config/nvim/init.lua<CR>") -- reload all vim configs...
map("n", "<leader>e", ":e ~/.config/nvim/init.lua<CR>") -- edit vim config...

map("n", "<leader>o", ":PackerCompile<CR>:PackerInstall<CR>") -- edit vim config...

map("n", "<leader>vs", ":vs<CR>") -- split window vertical
map("n", "<leader>hs", ":split<CR>") -- split window horizontally

map("n", "<F6>", ":terminal") -- open terminal in vim

-- map("n", "<C-t>", ":tabnew") -- create new tab
-- map("n", "<C-t><C-k>", ":tabprevious") -- navigate to previous tab
-- map("n", "<C-t><C-j>", ":tabnext") -- navigate to next tab
-- map("n", "<C-w>", ":bd") -- delete the current buffer

map("n", "<leader>T", ":tabprevious") -- navigate to previous tab
map("n", "<leader>t", ":tabnext") -- navigate to next tab

map("n", "<C-s>", ":update<cr>")
map("v", "<C-s>", "<c-c>:update<cr>")
map("i", "<C-s>", "<esc>:update<cr>gi")

-- Moving lines of text from one position to adjacent line position
map("v", "J", ":m '>+1<CR>gv=gv") -- move line down
map("v", "K", ":m '<-2<CR>gv=gv") -- move line up
map("i", "<C-j>", "<esc>:m .+1m<CR>==a") -- move line down
map("i", "<C-k>", "<esc>:m .-2m<CR>==a") -- move line up
map("n", "J", ":m .+1<CR>==") -- move line down
map("n", "K", ":m .-2<CR>==") -- move line up

-- re highlight lines when indenting them...
map("v", ">", ">gv") -- re-highlight when the lines are indented manually
map("v", "<", "<gv") -- same as the above one

-- Undo breaks throughout any code characters
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

-- -- sessions helper mappings
-- map("n", "<leader>mks", ":mks! nvim-session.sobhanbera")

-- -- mappings for copy and paste purpose...
-- -- below are some of the developer specific shortcuts...
-- -- just to fasten the coding proccess much more...
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
-- here h is here because by deafult v$ also covers the end of the line character....
-- so to remove it from the visual selection we need to use v$h

-- word specific commands
map("n", "vv", "viw") -- select a word

-- cancel search or stop searching
map("n", "<leader>i", "<Cmd>nohlsearch|diffupdate<CR>")

-- silly
map("n", "<leader>q", ":q <CR>") -- quiting vim

-- Will not work or will collapse with bufferline.nvim
-- Move to previous/next
map("n", "<leader>bp", ":bprevious<CR>")
map("n", "<leader>bn", ":bnext<CR>")
map("n", "<leader>b1", ":b1<CR>") -- these are some commands which will move the current buffer to different files
map("n", "<leader>b2", ":b2<CR>")
map("n", "<leader>b3", ":b3<CR>")
map("n", "<leader>b4", ":b4<CR>")
map("n", "<leader>b5", ":b5<CR>")
map("n", "<leader>b6", ":b6<CR>")
map("n", "<leader>bd", ":bd<CR>") --  delete the currentl buffer

-- navigation mappings like tmux <C-hjkl> to <C-w>hjkl
map("n", "<c-h>", "<c-w>h")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")

-- +-----------------------------------------------------+
-- |                        UTILITIES                    |
-- +-----------------------------------------------------+
-- For competitive programming...
map("n", "<leader>vscp", ":e in.txt <CR>:split out.txt<CR>")
map("n", "<leader>cp", ":cd ~/Documents/codes<CR>")

vim.cmd(
	"autocmd filetype cpp nnoremap <F9> :!g++ -std=c++14 -Wshadow -Wall -o %:r %:r.cpp -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG<CR>"
) -- compile cpp code in vim
vim.cmd("autocmd filetype cpp nnoremap <F9> :!g++ -std=c++14 -Wshadow -Wall -o %:r %:r.cpp<CR>") -- compile cpp code in vim
vim.cmd("autocmd filetype cpp nnoremap <F10> :vs<cr>:terminal ./%:r<cr>") -- execute cpp code in terminal of vim
vim.cmd("autocmd filetype cpp nnoremap <F12> :!g++-12 %:r.cpp -o %:r; gtimeout 4s ./%:r<cr>") -- compile and execute cpp code in terminal of vim

vim.cmd("autocmd filetype java nnoremap <F9> :!javac %:r.java") -- compile java code
vim.cmd("autocmd filetype java nnoremap <F10> :vs<cr>:terminal java %:r") -- execute java code

vim.cmd("autocmd filetype py,python nnoremap <F10> :vs<cr>:terminal python %") -- run python code in terminal of vim

vim.cmd("autocmd filetype js,javascript nnoremap <F10> !node %") -- execute js/node file

vim.cmd("autocmd filetype rs,rust nnoremap <F7> :!rustc %:r.rs<cr>") -- compile rust code
vim.cmd("autocmd filetype rs,rust nnoremap <F8> :vs<cr>:terminal ./%:r<cr>") -- execute rust code
vim.cmd("autocmd filetype rs,rust nnoremap <F9> :!cargo build<cr>") -- build rust code
vim.cmd("autocmd filetype rs,rust nnoremap <F10> :!cargo run<cr>") -- run built rust code

vim.cmd("autocmd filetype go nnoremap <F7> :!go run %:r.go<cr>") -- run go code
vim.cmd("autocmd filetype go nnoremap <F9> :!go build %:r.go<cr>") -- build go code
vim.cmd("autocmd filetype go nnoremap <F10> :vs<cr>:terminal ./%:r<cr>") -- execute go code

return M
