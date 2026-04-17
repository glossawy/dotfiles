---@type LazySpec[]
return require("utils.lists").concat_new(
  require("plugins.blink-cmp.main"),
  require("plugins.blink-cmp.supertab"),
  require("plugins.blink-cmp.sort"),
  require("plugins.blink-cmp.sources")
)
