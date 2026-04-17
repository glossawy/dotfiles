local cmp = require("utils.cmp")

return {
  {
    "saghen/blink.cmp",
    optional = true,
    ---@type blink.cmp.Config
    opts = {
      fuzzy = {
        implementation = "prefer_rust_with_warning",
        sorts = {
          cmp.deprioritize_by_kind("git"),
          "exact",
          "score",
          cmp.fns.underscores,
          "kind",
          "sort_text",
          cmp.fns.length,
        },
      },
    },
  },
}
