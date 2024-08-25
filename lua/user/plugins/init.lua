
return {
-- Basic plugins here
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins

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
	-- "numToStr/Comment.nvim", -- Easily comment stuff

	-- Git
  -- gitsigns

	-- File Tree
  -- nvim-tree

	-- Buffer line
  -- bufferline
	"moll/vim-bbye", -- to close the buffer without possibly leaving nvim

	-- Toggle terminal
  -- toggleterm

	-- Status line
  -- lualine

	-- Project menu
  -- project

	-- Greeter (menu) Alpha
  -- alpha

	-- Short cut reminder
  -- whichkey
}


