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
    local chatgpt = require("chatgpt")
		local status_ok, _ = pcall(chatgpt.setup, {
			api_key_cmd = key_cmd,
		})
    if not status_ok then 
      vim.notify("ChatGPT api not available", vim.log.levels.WARN)
    end
	end,
}
