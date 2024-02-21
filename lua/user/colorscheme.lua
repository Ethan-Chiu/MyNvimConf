local colorscheme = "tokyonight"

-- from tokyonight
-- tokyonight
-- tokyonight-night
-- tokyonight-storm
-- tokyonight-day
-- tokyonight-moon
--
-- catppuccin 
-- catppuccin-latte
-- catppuccin-frappe
-- catppuccin-macchiato
-- catppuccin-mocha
--
-- checkout darkplus
-- darkplus

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
