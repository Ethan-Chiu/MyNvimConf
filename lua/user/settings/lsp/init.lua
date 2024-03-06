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

local lsp_setup_status, init_lsp = pcall(require, "user.settings.lsp.handlers")
if not lsp_setup_status then
  vim.notify("lsp setup failed")
  return
end

init_lsp.setup()

