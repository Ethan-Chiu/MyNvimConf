local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
	return
end

surround.setup({
	-- Configuration here, or leave empty to use defaults
	surrounds = {
		-- ysiwc
		["c"] = {
			add = function()
				local cmd = require("nvim-surround.config").get_input("Command: ")
				return { { "\\" .. cmd .. "{" }, { "}" } }
			end,
		},
		-- VSe
		["e"] = {
			add = function()
				local env = require("nvim-surround.config").get_input("Environment: ")
				return { { "\\begin{" .. env .. "}" }, { "\\end{" .. env .. "}" } }
			end,
		},
	},
})
