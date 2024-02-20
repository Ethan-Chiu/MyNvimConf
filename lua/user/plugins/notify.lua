return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function ()
    vim.notify = require("notify")
  end
}

-- TODO: setup telescope extension for notify
-- (View notification history with telescope)

