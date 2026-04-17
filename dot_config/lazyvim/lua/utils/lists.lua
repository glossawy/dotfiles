local M = {}

---@generic T
---@param dst T[]
---@param src T[]
---@param ... T[]
---@return nil
function M.concat(dst, src, ...)
  local sources = { src, ... }

  for _, lst in ipairs(sources) do
    vim.list_extend(dst, lst)
  end
end

---@generic T
---@param src T[]
---@param ... T[]
---@return T[]
function M.concat_new(src, ...)
  local result = {}

  M.concat(result, src, ...)

  return result
end

return M
