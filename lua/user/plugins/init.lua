
return {
-- Basic plugins here
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	--[[ { "kyazdani42/nvim-web-devicons", name = ""}, ]]
	"lewis6991/impatient.nvim", -- Speed up loading Lua modules in Neovim to improve startup time

	-- Cmp plugins
  -- nvim-cmp
  -- snippets

	-- LSP
	"jose-elias-alvarez/null-ls.nvim", -- LSP diagnostics and code actions

	-- Telescope
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim",
	-- TODO: https://github.com/nvim-telescope/telescope.nvim#suggested-dependencies
	-- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	{
		"benfowler/telescope-luasnip.nvim",
		-- module = "telescope._extensions.luasnip", -- if you wish to lazy-load
	},

	-- Treesitter
	-- use "nvim-treesitter/playground"

	-- Autopair & indent indicator
	"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter

	-- Comment
	"numToStr/Comment.nvim", -- Easily comment stuff

	-- Git
	"lewis6991/gitsigns.nvim",

	-- File Tree
  -- nvim-tree

	-- Buffer line
	"akinsho/bufferline.nvim",
	"moll/vim-bbye", -- to close the buffer without possibly leaving nvim

	-- Toggle terminal
	"akinsho/toggleterm.nvim",

	-- Status line
	"nvim-lualine/lualine.nvim",

	-- Project menu
	"ahmedkhalf/project.nvim",

	-- Greeter (menu) Alpha
	{ "goolord/alpha-nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

	-- Short cut reminder
  -- whichkey


	"lervag/vimtex",

	{
		"kylechui/nvim-surround",
		version="*", -- Use for stability; omit to use `main` branch for the latest features
	},
}


