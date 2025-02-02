return {
	"JoosepAlviste/nvim-ts-context-commentstring",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"numToStr/Comment.nvim", -- Easily comment stuff
	},
	opts = {
		enable_autocmd = false,
	},
	config = function()
		local status_ok, comment = pcall(require, "Comment")
		if not status_ok then
			vim.notify("Comment can't be load", vim.log.levels.WARN)
			return
		end

		comment.setup({
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
	end,
}
