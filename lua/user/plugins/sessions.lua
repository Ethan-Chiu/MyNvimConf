return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		{ "<leader>Sl", "<cmd>SessionSearch<CR>", desc = "Session List" },
		{ "<leader>Sr", "<cmd>SessionRestore<CR>", desc = "Restore Session" },
		{ "<leader>Ss", "<cmd>SessionSave<CR>", desc = "Save Session" },
		{ "<leader>Sd", "<cmd>SessionPurgeOrphaned<CR>", desc = "Purge Session" },
	},
	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop" },
		-- log_level = 'debug',
		session_lens = {
			load_on_setup = true,
			previewer = false,
			mappings = {
				-- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
				delete_session = { "i", "<C-D>" },
				alternate_session = { "i", "<C-S>" },
			},
			theme_conf = {
				border = true,
				-- layout_config = {
				--   width = 0.8, -- Can set width and height as percent of window
				--   height = 0.5,
				-- },
			},
		},
		bypass_save_filetypes = { "snacks_dashboard", "dashboard", "NvimTree", "alpha", "netrw" },
		cwd_change_handling = true,
		-- Hooks
		pre_save_cmds = {
			"NvimTreeClose", -- Close NERDTree before saving session
		},

		post_restore_cmds = {
			"NvimTreeOpen",
		},

		pre_cwd_changed_cmds = {
			"NvimTreeClose", -- Close NERDTree before saving session
		},
		post_cwd_changed_cmds = {
			function()
				require("lualine").refresh() -- example refreshing the lualine status line _after_ the cwd changes
			end,
		},
	},
}
