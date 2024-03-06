local M = {}

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})


  -- global keymap
  local keymap = vim.keymap
	local opts = { noremap = true, silent = true }

  opts.desc = "Next diagnostic"
	keymap.set("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)

  opts.desc = "Previous diagnostic"
  keymap.set("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)

  opts.desc = "Show line diagnostic"
	keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.documentHighlight then
		vim.api.nvim_exec(
			[[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end

local function lsp_keymaps(bufnr)
  local api = vim.api
	local opts = { noremap = true, silent = true }

  opts.desc = "Go to declaration"
	api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)

  opts.desc = "Go to definition"
	api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

  opts.desc = "Go to implementation"
	api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

  opts.desc = "Go to references"
	api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

  opts.desc = "Go to type"
  api.nvim_buf_set_keymap(bufnr, "n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

  opts.desc = "Hover info"
	api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

  opts.desc = "Signature help"
	api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({async = true})' ]])
end


-- Setup on_attach
M.on_attach = function(client, bufnr)
	if client.name == "tsserver" or client.name == "lua_ls" then
		client.server_capabilities.documentFormattingProvider = false
	end
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

-- Setup capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	vim.notify("nvim lsp require failed")
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
