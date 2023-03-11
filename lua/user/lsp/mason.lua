local servers = {
	"lua_ls",
	"pyright",
	"jsonls",
}

local Set = require("user.core.container.set")
local servers_set = Set.create(servers)

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)

local mason_lsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lsp_ok then
	vim.notify("mason-lspconfig require failed")
	return
end
mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	vim.notify("lsp config require failed")
	return
end

local function resolve_mason_config(server_name)
	local found, mason_config = pcall(require, "mason-lspconfig.server_configurations." .. server_name)
	if not found then
		--[[ vim.notify("mason configuration not found for " .. server_name) ]]
		return {}
	end
	local server_mapping = require("mason-lspconfig.mappings.server")
	local path = require("mason-core.path")
	local pkg_name = server_mapping.lspconfig_to_package[server_name]
	local install_dir = path.package_prefix(pkg_name)
	local conf = mason_config(install_dir)
	--[[ vim.notify("resolved mason configuration for " .. server_name .. vim.inspect(conf)) ]]
	return conf or {}
end

local installed_servers = mason_lspconfig.get_installed_servers()
local opts = {}

for _, server in pairs(installed_servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	--[[ if servers_set[server] then ]]
  local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  else
    --[[ print(server) ]]
    local conf_opts = resolve_mason_config(server)
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
