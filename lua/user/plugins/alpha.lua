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

local function greeter1()
	return {
		[[ ______     ______   __  __     ______     __   __    ]],
		[[/\  ___\   /\__  _\ /\ \_\ \   /\  __ \   /\ "-.\ \   ]],
		[[\ \  __\   \/_/\ \/ \ \  __ \  \ \  __ \  \ \ \-.  \  ]],
		[[ \ \_____\    \ \_\  \ \_\ \_\  \ \_\ \_\  \ \_\\"\_\ ]],
		[[  \/_____/     \/_/   \/_/\/_/   \/_/\/_/   \/_/ \/_/ ]],
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

return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local status_ok, alpha = pcall(require, "alpha")
		if not status_ok then
			return
		end

		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = greeter1()
		dashboard.section.buttons.val = {
			dashboard.button("f", Gvim.icon.alpha.find_file .. "  Find file", ":Telescope find_files <CR>"),
			dashboard.button("e", Gvim.icon.alpha.new_file .. "  New file", ":ene <BAR> startinsert <CR>"), --
			dashboard.button("p", Gvim.icon.alpha.project .. "  Find project", ":Telescope projects <CR>"), --
			dashboard.button("r", Gvim.icon.alpha.recent .. "  Recently used files", ":Telescope oldfiles <CR>"),
			dashboard.button("t", Gvim.icon.alpha.find_text .. "  Find text", ":Telescope live_grep <CR>"),
			dashboard.button("c", Gvim.icon.alpha.setting .. "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
			dashboard.button("q", Gvim.icon.alpha.close .. "  Quit Neovim", ":qa<CR>"),
		}

		dashboard.section.footer.val = footer()

		dashboard.section.footer.opts.hl = "Type"
		dashboard.section.header.opts.hl = "Include"
		dashboard.section.buttons.opts.hl = "Keyword"

		dashboard.opts.opts.noautocmd = true

		alpha.setup(dashboard.opts)
	end,
}
