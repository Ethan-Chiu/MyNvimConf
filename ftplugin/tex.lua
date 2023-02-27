
-- [[ vim.g.vimtex_view_method = 'skim' ]]

-- [[ vim.g.vimtex_compiler_method = 'latexmd' ]]


local function focus_terminal()
  local _, _ pcall(vim.cmd, [[
      silent execute "!open -a iTerm"
      redraw!
  ]])
end


-- Same autocommand written with a Lua function instead
local mygroup = vim.api.nvim_create_augroup('vimtex_event_focus', { clear = true })
vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = 'VimtexEventViewReverse',
  group = mygroup,
  callback = focus_terminal,
  desc = "focus nvim when inverse search is performed"
})

