local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

pcall(function()
	require("nlspsettings").setup({
		config_home = vim.fn.stdpath("config") .. "/nlsp-settings",
		append_default_schemas = true,
		ignored_servers = {},
		loader = "json",
	})
end)

--[[ require("user.lsp.mason") ]]
require("user.lsp.handlers").setup()
--[[ require("user.lsp.null-ls") ]]
