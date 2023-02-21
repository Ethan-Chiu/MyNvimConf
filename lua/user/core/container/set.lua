local M = {}

function M.create(list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end

return M
