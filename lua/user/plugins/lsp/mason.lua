
local function setup()

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

  local config = require("user.lsp.config")
  mason_lspconfig.setup({
    ensure_installed = config.insure_installed_lsp,
    automatic_installation = true,
  })

end

return {
  "williamboman/mason.nvim", -- simple to use language server installer
  dependencies = {
    "williamboman/mason-lspconfig.nvim", -- simple to use language server installer
  },
  config = setup
}
