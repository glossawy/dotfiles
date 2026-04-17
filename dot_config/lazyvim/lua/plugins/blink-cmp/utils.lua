local M = {}
local S = {}

---@param src blink.cmp.Config
---@return blink.cmp.Config opts
function S._initialize_opts(src)
  ---@type blink.cmp.Config
  local default = {
    sources = {
      default = {},
      providers = {},
    },
  }

  src = vim.tbl_deep_extend("keep", src, default)

  if type(src.sources.default) == "function" then
    src.sources.default = src.sources.default()
  end

  return src
end

---@alias utils.blink.cmp.Source string|{source: string; provider: blink.cmp.SourceProviderConfig}

---@class utils.blink.cmp.PreparedSource
---@field name string
---@field pkg LazySpec
---@field provider? blink.cmp.SourceProviderConfig
local PS = {}
PS.__index = PS

---@param opts blink.cmp.Config
function PS:insert_into(opts)
  S._initialize_opts(opts)

  local defaults = opts.sources.default
  ---@cast defaults string[]

  vim.list_extend(defaults, { self.name })

  if self.provider ~= nil then
    opts.sources.providers = vim.tbl_deep_extend("force", opts.sources.providers, {
      [self.name] = self.provider,
    })
  end
end

---@param opts blink.cmp.SourceProviderConfig
---@return utils.blink.cmp.PreparedSource
function PS:extend(opts)
  return S.new(self.name, self.pkg, vim.tbl_deep_extend("force", self.provider, opts))
end

---@return fun(_, opts: blink.cmp.Config):nil
function PS:as_opts_func()
  return function(_, opts)
    self:insert_into(opts)
  end
end

---@param optional? boolean
---@return LazySpec
function PS:as_spec(optional)
  optional = optional == nil and true or false

  return {
    "saghen/blink.cmp",
    optional = optional,
    dependencies = { self.pkg },
    opts = self:as_opts_func(),
  }
end

---@return utils.blink.cmp.PreparedSource
function PS:as_compat()
  return self:extend({
    module = "blink.compat.source",
  })
end

---@param name string
---@param pkg LazySpec
---@param provider? blink.cmp.SourceProviderConfig
---@return utils.blink.cmp.PreparedSource
function S.new(name, pkg, provider)
  provider = vim.tbl_extend("keep", provider, {
    module = module,
  })

  local ps = { name = name, pkg = pkg, provider = provider }

  setmetatable(ps, PS)

  return ps
end

S.prepared = PS
M.sources = S

return M
