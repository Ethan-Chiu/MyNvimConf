--------------------------------------------------
-- Define an augroup for general settings
--------------------------------------------------
local general_settings_group = vim.api.nvim_create_augroup("_general_settings", { clear = true })

-- Automatically map 'q' to ':close<CR>' in certain file types.
-- This is useful for quickly closing help, man, and lspinfo buffers.
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf", "help", "man", "lspinfo" },
	command = "nnoremap <silent> <buffer> q :close<CR>",
	group = general_settings_group,
})

-- Highlight text on yank with the 'Search' highlight group for 200 milliseconds.
-- This helps in visually confirming what's been yanked.
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "Search", timeout = 200 })
	end,
	group = general_settings_group,
})

-- Modify 'formatoptions' upon entering a buffer to prevent certain automatic formatting.
-- 'formatoptions-=cro' disables comment continuation on newlines and other automatic formatting.
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*",
	command = "set formatoptions-=cro",
	group = general_settings_group,
})

-- Set quickfix buffers to not be listed with `:ls`.
-- This helps keep buffer lists cleaner by excluding quickfix buffers from them.
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	command = "set nobuflisted",
	group = general_settings_group,
})

--------------------------------------------------
-- Define an augroup for git-related settings
--------------------------------------------------
local git_group = vim.api.nvim_create_augroup("_git", { clear = true })

-- Enable line wrapping for git commit messages to help maintain readable commit text.
vim.api.nvim_create_autocmd("FileType", {
	pattern = "gitcommit",
	command = "setlocal wrap",
	group = git_group,
})

-- Enable spell checking for git commit messages.
-- This helps in catching typos in commit messages.
vim.api.nvim_create_autocmd("FileType", {
	pattern = "gitcommit",
	command = "setlocal spell",
	group = git_group,
})

--------------------------------------------------
-- Define an augroup for markdown settings
--------------------------------------------------
local markdown_group = vim.api.nvim_create_augroup("_markdown", { clear = true })

-- Enable line wrapping in markdown files to improve readability when writing.
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	command = "setlocal wrap",
	group = markdown_group,
})

-- Enable spell checking in markdown files.
-- This is useful for catching spelling errors in documents or notes.
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	command = "setlocal spell",
	group = markdown_group,
})

-- Define an augroup for auto-resize
local auto_resize_group = vim.api.nvim_create_augroup("_auto_resize", { clear = true })

-- Automatically resize windows when the Vim window is resized.
-- 'tabdo wincmd =' ensures all splits are equally sized.
vim.api.nvim_create_autocmd("VimResized", {
	pattern = "*",
	command = "tabdo wincmd =",
	group = auto_resize_group,
})

--------------------------------------------------
-- Define an augroup for alpha settings
--------------------------------------------------
local alpha_group = vim.api.nvim_create_augroup("_alpha", { clear = true })

-- Hide the tabline when the Alpha plugin is ready, and restore it on buffer unload.
-- This is typically done to maintain a clean look in the start screen.
vim.api.nvim_create_autocmd("User", {
	pattern = "AlphaReady",
	command = "set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2",
	group = alpha_group,
})

--------------------------------------------------
-- Define an augroup for lazygit keymap settings
--------------------------------------------------
local lazygit_group = vim.api.nvim_create_augroup("_lazygit_mapping", { clear = true })

-- Disable windows navigation keymaps for lazygit terminal
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		-- Get the name of the terminal buffer
		local bufname = vim.api.nvim_buf_get_name(0)

		-- Check if the buffer name corresponds to lazygit
		if bufname:match("lazygit") then
			-- Disable keymaps for lazygit
      vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', '<Nop>', { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', '<Nop>', { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', '<Nop>', { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', '<Nop>', { noremap = true, silent = true })
		end
	end,
	group = lazygit_group,
})
