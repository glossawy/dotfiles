local M = {}

---@param name string
---@return blink.cmp.SortFunction
function M.deprioritize_by_kind(name)
  name = name:lower()
  return function(item1, item2)
    local c1, c2 = item1.kind_name, item2.kind_name

    if c1 == nil or c2 == nil or c1 == c2 then
      return
    else
      return c2:lower() == name
    end
  end
end

---@class utils.Cmp.SortFnsTable
---@field underscores blink.cmp.SortFunction
---@field length blink.cmp.SortFunction
local fns = {}

function fns.underscores(item1, item2)
  local _, under1 = item1.label:find("^_+")
  local _, under2 = item2.label:find("^_+")

  under1 = under1 or 0
  under2 = under2 or 0

  if under1 > under2 then
    return false
  elseif under1 < under2 then
    return true
  end
end

function fns.length(item1, item2)
  if #item1.label > #item2.label then
    return false
  elseif #item1.label < #item2.label then
    return true
  end
end

M.fns = fns

return M
