local function greeter0()
	return {
		[[                               __                ]],
		[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
		[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
		[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
		[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
		[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
	}
end

local function greeter2()
	return {
		[[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
	}
end

local function greeter1()
	return {
		[[
  ______     ______   __  __     ______     __   __    
 /\  ___\   /\__  _\ /\ \_\ \   /\  __ \   /\ "-.\ \   
 \ \  __\   \/_/\ \/ \ \  __ \  \ \  __ \  \ \ \-.  \  
  \ \_____\    \ \_\  \ \_\ \_\  \ \_\ \_\  \ \_\\"\_\ 
   \/_____/     \/_/   \/_/\/_/   \/_/\/_/   \/_/ \/_/ ]],
	}
end

local function footer()
	-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "ethan"
end

return
---@class snacks.dashboard.Config
---@field enabled? boolean
---@field sections snacks.dashboard.Section
---@field formats table<string, snacks.dashboard.Text|fun(item:snacks.dashboard.Item, ctx:snacks.dashboard.Format.ctx):snacks.dashboard.Text>
{
	width = 65,
	row = nil, -- dashboard position. nil for center
	col = nil, -- dashboard position. nil for center
	pane_gap = 4, -- empty columns between vertical panes
	autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
	-- These settings are used by some built-in sections
	preset = {
		-- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
		---@type fun(cmd:string, opts:table)|nil
		pick = nil,
		-- Used by the `keys` section to show keymaps.
		-- Set your custom keymaps here.
		-- When using a function, the `items` argument are the default keymaps.
		---@type snacks.dashboard.Item[]
		keys = {
			{ icon = Gvim.icon.dashboard.find_file, key = "f", desc = " Find File", action = ":lua Snacks.dashboard.pick('files')" },
			{ icon = Gvim.icon.dashboard.new_file, key = "n", desc = " New File", action = ":ene | startinsert" },
      { icon = Gvim.icon.dashboard.project, key = "p", desc = " Find Project", action = ":Telescope projects_session" },
			{ icon = Gvim.icon.dashboard.recent, key = "r", desc = " Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
			{ icon = Gvim.icon.dashboard.find_text, key = "F", desc = " Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
			{
				icon = Gvim.icon.dashboard.setting,
				key = "c",
				desc = " Config",
				action = ":e ~/.config/nvim/init.lua",
			},
			{ icon = Gvim.icon.dashboard.reload_session, key = "s", desc = " Restore Session", section = "session" },
			{ icon = Gvim.icon.dashboard.lazy, key = "L", desc = " Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
			{ icon = Gvim.icon.dashboard.quit, key = "q", desc = " Quit", action = ":qa" },
		},
		-- Used by the `header` section
		header = greeter1(),
	},
	sections = {
		{ section = "header" },
		{ section = "keys", gap = 1, padding = 1 },
		{ pane = 2, icon = Gvim.icon.dashboard.recent, title = " Recent Files", section = "recent_files", indent = 2, padding = 1 },
		{ pane = 2, icon = Gvim.icon.dashboard.recent_projects, title = " Projects", section = "projects", indent = 2, padding = 1 },
		{
			pane = 2,
			icon = Gvim.icon.dashboard.git_status,
			title = " Git Status",
			section = "terminal",
			enabled = function()
				return Snacks.git.get_root() ~= nil
			end,
			cmd = "git status --short --branch --renames",
			height = 5,
			padding = 1,
			ttl = 5 * 60,
			indent = 3,
		},
		{ section = "startup" },
	},
}
