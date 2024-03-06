
return {
-- Basic plugins here
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	--[[ { "kyazdani42/nvim-web-devicons", name = ""}, ]]
	"lewis6991/impatient.nvim", -- Speed up loading Lua modules in Neovim to improve startup time

	-- Cmp plugins
  -- nvim-cmp
  -- snippets

	-- Telescope
	"nvim-telescope/telescope-media-files.nvim",
	{
		"benfowler/telescope-luasnip.nvim",
		-- module = "telescope._extensions.luasnip", -- if you wish to lazy-load
	},

	-- Treesitter
	-- use "nvim-treesitter/playground"

	-- Autopair & indent indicator
  -- Autopair

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
  -- toggleterm

	-- Status line
	"nvim-lualine/lualine.nvim",

	-- Project menu
	"ahmedkhalf/project.nvim",

	-- Greeter (menu) Alpha
  -- alpha

	-- Short cut reminder
  -- whichkey

	{
		"kylechui/nvim-surround",
		version="*", -- Use for stability; omit to use `main` branch for the latest features
	},
}


