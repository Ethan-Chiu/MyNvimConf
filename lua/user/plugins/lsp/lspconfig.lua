
local function setup()
	local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
	if not lspconfig_status_ok then
		vim.notify("lsp config require failed", vim.log.levels.WARN)
		return
	end

  local mason_lsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
  if not mason_lsp_ok then
    vim.notify("mason-lspconfig require failed", vim.log.levels.OFF)
    return
  end

  -- find if there is a config file for server_name in mason-lspconfig 
  local function resolve_mason_config(server_name)
    local found, mason_config = pcall(require, "mason-lspconfig.server_configurations." .. server_name)
    if not found then
      vim.notify("mason lsp configuration not found for " .. server_name)
      return {}
    end
    local server_mapping = require("mason-lspconfig.mappings.server")
    local path = require("mason-core.path")
    local pkg_name = server_mapping.lspconfig_to_package[server_name]
    vim.notify(pkg_name)
    local install_dir = path.package_prefix(pkg_name)
    local conf = mason_config(install_dir)
    return conf or {}
  end
  
  -- configuration for installed LSP servers 
  local installed_servers = mason_lspconfig.get_installed_servers()
  local opts = {}

  for _, server in pairs(installed_servers) do
    opts = {
      on_attach = require("user.lsp.handlers").on_attach,
      capabilities = require("user.lsp.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
    if require_ok then
      -- use custom config 
      opts = vim.tbl_deep_extend("force", conf_opts, opts)
      vim.notify("custom config for " .. server .. " is loaded")
    else
      -- config from mason-lsp
      local conf_opts = resolve_mason_config(server)
      opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    lspconfig[server].setup(opts)
  end

end

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
	config = setup,
}
