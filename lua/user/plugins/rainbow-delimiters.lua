return {
  "https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git",
	event = { "BufReadPre", "BufNewFile" },
  config = function ()
    local status_ok, rainbow= pcall(require, "rainbow-delimiters")
    if not status_ok then
      vim.notify("Rainbow not loaded", vim.log.levels.WARN)
      return
    end

    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = rainbow.strategy['global'],
        vim = rainbow.strategy['local'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
        tsx = 'rainbow-tag',
      },
      priority = {
        [''] = 110,
        lua = 210,
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
    }

  end
}
