return {
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
    config = function ()
      local status_ok, _ = pcall(require, "user.settings.colorscheme")
      if not status_ok then
        return
      end
    end
	},
	{ "catppuccin/nvim", lazy = false, name = "catppuccin" },
  -- "lunarvim/darkplus.nvim"
}
