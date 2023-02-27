local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Basic plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("kyazdani42/nvim-web-devicons")
	use("lewis6991/impatient.nvim") -- Speed up loading Lua modules in Neovim to improve startup time

	-- Color Schemes
	use("folke/tokyonight.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	-- use "lunarvim/darkplus.nvim"

	-- Cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

	-- Snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("williamboman/mason.nvim") -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
	use("neovim/nvim-lspconfig") -- enable LSP
	use("jose-elias-alvarez/null-ls.nvim") -- LSP diagnostics and code actions

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	-- TODO: https://github.com/nvim-telescope/telescope.nvim#suggested-dependencies
	-- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	-- use({
		-- "benfowler/telescope-luasnip.nvim",
		-- module = "telescope._extensions.luasnip", -- if you wish to lazy-load
	-- })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow")
	-- use "nvim-treesitter/playground"

	-- Autopair & indent indicator
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("lukas-reineke/indent-blankline.nvim")

	-- Comment
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- File Tree
	use("kyazdani42/nvim-tree.lua")

	-- Buffer line
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye") -- to close the buffer without possibly leaving nvim

	-- Toggle terminal
	use("akinsho/toggleterm.nvim")

	-- Status line
	use("nvim-lualine/lualine.nvim")

	-- Project menu
	use("ahmedkhalf/project.nvim")

	-- Greeter (menu) Alpha
	use({ "goolord/alpha-nvim", requires = { "nvim-tree/nvim-web-devicons" } })

	-- Short cut reminder
	use("folke/which-key.nvim")

	use("RRethy/vim-illuminate")

	use("lervag/vimtex")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
