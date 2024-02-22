local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Basic settings --------------------
-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Close buffer
-- keymap("n", "<C-w>", ":Bdelete!<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<C-S-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<C-S-k>", "<Esc>:m .-2<CR>==", opts)

-- Toggle term
-- floating terminal
keymap("n", "<C-\\>", "<cmd>ToggleTerm direction=float<cr>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<C-S-j>", ":m .+1<CR>==", opts)
keymap("v", "<C-S-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<C-S-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-S-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Additional setting for plugins functions --------------------

-- Project --
-- built in mappings
--  (n) ( i ) (    actions     )
--[[ f	<c-f>	find_project_files ]]
--[[ b	<c-b>	browse_project_files ]]
--[[ d	<c-d>	delete_project ]]
--[[ s	<c-s>	search_in_project_files ]]
--[[ r	<c-r>	recent_project_files ]]
--[[ w	<c-w>	change_working_directory ]]
