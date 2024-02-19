
return {
-- Basic plugins here
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	--[[ { "kyazdani42/nvim-web-devicons", name = ""}, ]]
	"lewis6991/impatient.nvim", -- Speed up loading Lua modules in Neovim to improve startup time

	-- Color Schemes
	"folke/tokyonight.nvim",
	{ "catppuccin/nvim", name = "catppuccin" },
	-- use "lunarvim/darkplus.nvim"

	-- Cmp plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp",
	"saadparwaiz1/cmp_luasnip", -- snippet completions

	-- Snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	-- LSP
  "williamboman/mason.nvim", -- simple to use language server installer
	"williamboman/mason-lspconfig.nvim", -- simple to use language server installer
	"neovim/nvim-lspconfig", -- enable LSP
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
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"p00f/nvim-ts-rainbow",
	-- use "nvim-treesitter/playground"

	-- Autopair & indent indicator
	"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

	-- Comment
	"numToStr/Comment.nvim", -- Easily comment stuff
	"JoosepAlviste/nvim-ts-context-commentstring",

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
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },

	"RRethy/vim-illuminate",

	"lervag/vimtex",

	{
		"kylechui/nvim-surround",
		version="*", -- Use for stability; omit to use `main` branch for the latest features
	},
}


