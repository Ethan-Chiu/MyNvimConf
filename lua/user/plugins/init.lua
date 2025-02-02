return {
	-- Basic plugins here
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	-- Icons
	{ "echasnovski/mini.icons", version = false },
	-- Telescope
	"nvim-telescope/telescope-media-files.nvim",
	{
		"benfowler/telescope-luasnip.nvim",
		-- module = "telescope._extensions.luasnip", -- if you wish to lazy-load
	},
	"moll/vim-bbye", -- to close the buffer without possibly leaving nvim
}
