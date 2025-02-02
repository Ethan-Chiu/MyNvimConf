local dashboard_config = require("user.plugins.utils.dashboard")

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = dashboard_config,
    indent = {
      enabled = true,
      char = "▎",
      scope = {
        enabled = true, -- enable highlighting the current scope
        priority = 200,
        char = "▎",
        underline = true, -- underline the start of the scope
      },
    },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = { enabled = false },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = false },
    words = { enabled = true },
    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      }
    }
  },
  keys = {
    { "<leader>zm", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    { "<leader>zz", function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
    { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    { "<leader>nh", function() Snacks.notifier.show_history() end, desc = "Notification History" },
    { "<leader>nd", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    --[[ { "<leader>w",  function() Snacks.bufdelete() end, desc = "Delete Buffer" }, ]]
    { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
    { "<leader>gO", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
    { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
    { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
    --[[ { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" }, ]]
    --[[ { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" }, ]]
    { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    }
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>Ts")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>Tw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>TL")
        Snacks.toggle.diagnostics():map("<leader>Td")
        Snacks.toggle.line_number():map("<leader>Tl")
        Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>Tc")
        Snacks.toggle.treesitter():map("<leader>TT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>Tb")
        Snacks.toggle.inlay_hints():map("<leader>Th")
        Snacks.toggle.indent():map("<leader>Tg")
        Snacks.toggle.dim():map("<leader>TD")
      end,
    })
  end,
}
