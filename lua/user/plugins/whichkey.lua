local config = {
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
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	-- key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	-- },
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	--[[ popup_mappings = { ]]
	--[[ 	scroll_down = "<c-d>", -- binding to scroll down inside the popup ]]
	--[[ 	scroll_up = "<c-u>", -- binding to scroll up inside the popup ]]
	--[[ }, ]]
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
  keys = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	--[[ ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label ]]
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = {
    "<leader>"
  },
	-- triggers = {"<leader>"} -- or specify a list manually
	-- triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		-- i = { "j", "k" },
		-- v = { "j", "k" },
	-- },
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["/"] = { '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', "Comment" },
	["a"] = { "<cmd>Alpha<cr>", "Alpha" },
	["b"] = {
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Buffers",
	},
	["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
	["s"] = { "<cmd>w!<CR>", "Save" },
	["q"] = { "<cmd>q!<CR>", "Quit" },
	["w"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	["f"] = {
		"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>",
		"Find files",
	},
  ['u'] = { "<cmd>UndotreeToggle<CR>", "Undo Tree" },
	["F"] = { "<cmd>Telescope live_grep theme=ivy<CR>", "Find Text" },
	["P"] = { "<cmd>Telescope projects<CR>", "Projects" },
	["M"] = { "<cmd>Mason<CR>", "Mason" },

	y = {
		name = "Lazy",
		m = { "<cmd>Lazy home<cr>", "Menu" },
		b = { ":Lazy build<space>", "Rebuild [plugin]", silent = false },
		c = { ":Lazy check ", "Check [plugin?]", silent = false },
		i = { ":Lazy install ", "Install [plugin?]", silent = false },
		s = { ":Lazy sync ", "Sync [plugin?]", silent = false },
		l = { ":Lazy load ", "Load [plugin]", silent = false },
		u = { ":Lazy update ", "Update [plugin?]", silent = false },
	},

	g = {
		name = "Git",
		--[[ g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" }, ]]
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		B = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
	},

	l = {
		name = "LSP",
		-- Actions
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		-- l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },

		-- TODO: quick fix

		-- Diagnostics
		d = {
			"<cmd>lua vim.diagnostic.setloclist()<cr>",
			"Show Line Diagnostics",
		},
		D = {
			"<cmd>Telescope diagnostics bufnr=0<cr>",
			"Document Diagnostics",
		},
		j = {
			"<cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<cr>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<cr>",
			"Prev Diagnostic",
		},
		-- TODO: workspace diagnostics

		-- LSP
		i = { "<cmd>LspInfo<cr>", "Info" },
		R = { "<cmd>LspRestart<cr>", "Restart LSP" },
		-- I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },

		-- Info
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},

	r = {
		name = "Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		s = { "<cmd>Telescope luasnip<cr>", "Find Snippets" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		n = { "<cmd>Telescope notify<cr>", "Notifications" },
		N = { "<cmd>Notifications<cr>", "Notifications logs" },
	},

	t = {
		name = "Terminal",
		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		--[[ u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" }, ]]
		--[[ t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" }, ]]
		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},

	W = {
		name = "Window",
		k = { "<cmd>resize +2<cr>", "Increase height" },
		j = { "<cmd>resize -2<cr>", "Decrease height" },
		l = { "<cmd>vertical resize +5<cr>", "Increase width" },
		h = { "<cmd>vertical resize -5<cr>", "Decrease width" },
	},

  x = {
    name = "Trouble",
  },

  C = {
    name = "ChatGPT",
  }
}

local vopts = {
	mode = "v", -- VISUAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local vmappings = {
	["/"] = { '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', "Comment" },
}

local function setup()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end

	which_key.setup(config)
	which_key.register(mappings, opts)
	which_key.register(vmappings, vopts)
end

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = setup,
}
