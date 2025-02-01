return {
	"neolooong/whichpy.nvim",
	dependencies = {
		-- optional for dap
		-- "mfussenegger/nvim-dap-python",
		-- optional for picker support
		-- "ibhagwan/fzf-lua",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		picker = {
			name = "telescope", -- must be one of ("builtin", "fzf-lua", "telescope")
		},
	},
}
