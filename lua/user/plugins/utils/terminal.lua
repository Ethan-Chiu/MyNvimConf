local M = {}

M.meta = {
	desc = "Terminal triggers",
}

---Toggle a floating terming. Open and close with the same key
---@param key string 
function M.floating_term_toggle(key)
	Snacks.terminal.toggle(nil, {
		win = {
			position = "float",
      border = "rounded",
			keys = {
				toggle_close = {
					key,
          "hide",
					mode = "t",
					expr = true,
					desc = "Double escape to normal mode",
				},
			},
		},
	})
end

return M
