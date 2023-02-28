local vscode_snip_ok, vscode_snip_loader = pcall(require, "luasnip.loaders.from_vscode")
if not vscode_snip_ok then
  print("vscode snip loader failed")
  return
end

local snipmate_snip_ok, snipmate_snip_loader = pcall(require, "luasnip.loaders.from_snipmate")
if not snipmate_snip_ok then
  print("snipmate snip loader failed")
  return
end

local lua_snip_ok, lua_snip_loader = pcall(require, "luasnip.loaders.from_lua")
if not lua_snip_ok then
  print("lua snip loader failed")
  return
end

vscode_snip_loader.lazy_load()

vscode_snip_loader.lazy_load({ paths = {"./snippets/vscode"} })
snipmate_snip_loader.lazy_load({ paths = {"./snippets/snipmate"} })
lua_snip_loader.lazy_load({ paths = {"./snippets/lua"} })

