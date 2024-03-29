return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    enabled = true,
    debounce = 200,
    --[[ indent = { char = "▏" }, ]]
    --[[ scope = { exclude = { language = { "lua" } } }, ]]
  }
}


-- vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
-- vim.g.indent_blankline_filetype_exclude = {
-- 	"help",
-- 	"startify",
-- 	"dashboard",
-- 	"packer",
-- 	"neogitstatus",
-- 	"NvimTree",
-- 	"Trouble",
-- }
-- vim.g.indent_blankline_context_patterns = {
-- 	"class",
-- 	"return",
-- 	"function",
-- 	"method",
-- 	"^if",
-- 	"^while",
-- 	"jsx_element",
-- 	"^for",
-- 	"^object",
-- 	"^table",
-- 	"block",
-- 	"arguments",
-- 	"if_statement",
-- 	"else_clause",
-- 	"jsx_element",
-- 	"jsx_self_closing_element",
-- 	"try_statement",
-- 	"catch_clause",
-- 	"import_statement",
-- 	"operation_type",
-- }

-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "space:"
-- vim.opt.listchars:append "eol:↴"

