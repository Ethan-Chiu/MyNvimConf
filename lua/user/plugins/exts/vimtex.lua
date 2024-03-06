return {
  "lervag/vimtex",
  event = "VeryLazy",
  init = function()
    -- Use init for configuration, don't use the more common "config".
    vim.g.vimtex_view_method = 'skim'

    --[[ Or with a generic interface: ]]
    -- [[ vim.g.vimtex_view_general_viewer = 'okular' ]]
    -- [[ vim.g.vimtex_view_general_options = [[ --unique file:@pdf\#src:@line@tex ]] ]]

    vim.g.vimtex_compiler_method = 'latexmk'
  end
}
