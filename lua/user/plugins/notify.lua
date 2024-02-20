return {
  "rcarriga/nvim-notify",
  --[[ event = "VeryLazy", ]]
  priority = 100,
  config = function ()
    vim.notify = require("notify")
  end
}

-- TODO: setup telescope extension for notify
-- (View notification history with telescope)

