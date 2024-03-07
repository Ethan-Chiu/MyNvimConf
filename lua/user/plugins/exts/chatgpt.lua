return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
    local key_cmd = "pass show dev/openai/chatgpt"
		require("chatgpt").setup({
			api_key_cmd = key_cmd,
		})
	end,
}
