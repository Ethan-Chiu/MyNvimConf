local config = {
  preset = "modern",
	triggers = {
    "<leader>"
  },
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
  win = {
    -- don't allow the popup to overlap with the cursor
    no_overlap = true,
    -- width = 1,
    -- height = { min = 4, max = 25 },
    -- col = 0,
    -- row = math.huge,
    -- border = "none",
    padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
    title = true,
    title_pos = "center",
    zindex = 1000,
    -- Additional vim.wo and vim.bo options
    bo = {},
    wo = {
      -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    },
  },
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
  keys = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	show_help = true, -- show help message on the command line when the popup is visible
}


local mappings = {
  nowait = true,
  remap = false,
  { "<leader>/", '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', desc = "Comment", icon="" },
  { "<leader>F", "<cmd>Telescope live_grep theme=ivy<CR>", desc = "Find Text" },
  { "<leader>M", "<cmd>Mason<CR>", desc = "Mason", icon="󱌢" },
  { "<leader>P", "<cmd>Telescope projects<CR>", desc = "Projects", icon=Gvim.icon.alpha.project },
  { "<leader>a", "<cmd>Alpha<cr>", desc = "Alpha", icon="󰀫" },
  { "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Buffers" },
  { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Explorer", icon="󰙅" },
  { "<leader>f", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>", desc = "Find files" },
  { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight", icon="󰸱" },
  { "<leader>q", "<cmd>q!<CR>", desc = "Quit" },
  { "<leader>s", "<cmd>w!<CR>", desc = "Save", icon="" },
  { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Undo Tree", icon="" },
  { "<leader>w", "<cmd>Bdelete!<CR>", desc = "Close Buffer" },

  { "<leader>C", group = "ChatGPT", icon="" },

  { "<leader>S", group = "Session", icon="" },

  { "<leader>W", group = "Window" },
  { "<leader>Wh", "<cmd>vertical resize -5<cr>", desc = "Decrease width" },
  { "<leader>Wj", "<cmd>resize -2<cr>", desc = "Decrease height" },
  { "<leader>Wk", "<cmd>resize +2<cr>", desc = "Increase height" },
  { "<leader>Wl", "<cmd>vertical resize +5<cr>", desc = "Increase width" },

  { "<leader>g", group = "Git" },
  { "<leader>gB", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
  { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
  { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
  { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
  { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
  { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
  { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },
  { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
  { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
  { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
  { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
  { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },

  { "<leader>l", group = "LSP", icon="󰞋" },
  { "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
  { "<leader>lR", "<cmd>LspRestart<cr>", desc = "Restart LSP" },
  { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
  { "<leader>ld", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Show Line Diagnostics" },
  { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
  { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<cr>", desc = "Next Diagnostic" },
  { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<cr>", desc = "Prev Diagnostic" },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
  { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },

  { "<leader>r", group = "Search" },
  { "<leader>rC", "<cmd>Telescope commands<cr>", desc = "Commands" },
  { "<leader>rM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
  { "<leader>rN", "<cmd>Notifications<cr>", desc = "Notifications logs" },
  { "<leader>rR", "<cmd>Telescope registers<cr>", desc = "Registers" },
  { "<leader>rb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
  { "<leader>rc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
  { "<leader>rh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
  { "<leader>rk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
  { "<leader>rn", "<cmd>Telescope notify<cr>", desc = "Notifications" },
  { "<leader>rr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
  { "<leader>rs", "<cmd>Telescope luasnip<cr>", desc = "Find Snippets" },

  { "<leader>t", group = "Terminal" },
  { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float" },
  { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal" },
  { "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", desc = "Node" },
  { "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", desc = "Python" },
  { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical" },

  { "<leader>x", group = "Trouble", icon="󰒑" },

  { "<leader>y", group = "Lazy" },
  { "<leader>yb", ":Lazy build<space>", desc = "Rebuild [plugin]", silent = false },
  { "<leader>yc", ":Lazy check ", desc = "Check [plugin?]", silent = false },
  { "<leader>yi", ":Lazy install ", desc = "Install [plugin?]", silent = false },
  { "<leader>yl", ":Lazy load ", desc = "Load [plugin]", silent = false },
  { "<leader>ym", "<cmd>Lazy home<cr>", desc = "Menu" },
  { "<leader>ys", ":Lazy sync ", desc = "Sync [plugin?]", silent = false },
  { "<leader>yu", ":Lazy update ", desc = "Update [plugin?]", silent = false },
}

local old_mappings = {
	g = {
		name = "Git",
		--[[ g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" }, ]]
	},

	l = {
		name = "LSP",
		-- Actions
		-- l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },

		-- TODO: quick fix
		-- TODO: workspace diagnostics

		-- LSP
		-- I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
	},

	t = {
		name = "Terminal",
		--[[ u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" }, ]]
		--[[ t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" }, ]]
	},
}

local vmappings = {
  { "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', desc = "Comment", mode = "v", nowait = true, remap = false },
}

local function setup()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end

	which_key.setup(config)
	which_key.add(mappings)
	which_key.add(vmappings)
end

return {
	"folke/which-key.nvim",
	dependencies = { "echasnovski/mini.icons" },
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = setup,
}
