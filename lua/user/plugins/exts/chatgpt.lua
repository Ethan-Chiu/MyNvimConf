return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim",
		"akinsho/toggleterm.nvim",
	},
	config = function()
    local config_path = vim.fn.stdpath('config')
    local key_path = config_path .. "/lua/user/plugins/exts/gptkey"
    local key_cmd = "cat " .. key_path
    local chatgpt = require("chatgpt")
		local status_ok, _ = pcall(chatgpt.setup, {
			api_key_cmd = key_cmd,
		})
		if not status_ok then
			vim.notify("ChatGPT api not available", vim.log.levels.WARN)
		end

		vim.keymap.set("n", "<leader>Cc", "<cmd>ChatGPT<cr>", { desc = "ChatGPT" })

		vim.keymap.set("n", "<leader>Cp", "<cmd>ChatGPTActAs<cr>", { desc = "ChatGPT Act as" })

  --[[ local Terminal = require("toggleterm.terminal").Terminal ]]

	--[[ 	local pass_show = Terminal:new({ ]]
	--[[ 		cmd = key_cmd, ]]
  --[[      direction = "float", ]]
	--[[ 		hidden = false, ]]
	--[[ 		on_close = function() ]]
	--[[ 			local status_after_ok, _ = pcall(chatgpt.setup, { ]]
	--[[ 				api_key_cmd = key_cmd, ]]
	--[[ 			}) ]]
	--[[ 			if not status_after_ok then ]]
	--[[ 				vim.notify("ChatGPT api not available", vim.log.levels.WARN) ]]
	--[[ 			end ]]
	--[[ 		end, ]]
	--[[ 	}) ]]

	--[[ 	function _pass_show_toggle() ]]
	--[[ 		pass_show:toggle() ]]
	--[[ 	end ]]

	--[[ 	vim.keymap.set( ]]
	--[[ 		"n", ]]
	--[[ 		"<leader>CP", ]]
	--[[ 		"<cmd>lua _pass_show_toggle()<CR>", ]]
	--[[ 		{ desc = "ChatGPT Password", noremap = true, silent = true } ]]
	--[[ 	) ]]
	end,
}
