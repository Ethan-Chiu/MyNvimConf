return {
	"Exafunction/codeium.vim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local opts = { expr = true, silent = true, noremap = true }

		opts.desc = "Accept codium"
		vim.keymap.set("i", "<C-c>]", function()
			return vim.fn["codeium#Accept"]()
		end, opts)
		vim.keymap.set("i", "<C-c>[", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true, silent = true })
		--[[ vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true }) ]]
		--[[ vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true }) ]]
	end,
}
