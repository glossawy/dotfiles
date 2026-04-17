return {
  {
    "saghen/blink.cmp",
    optional = true,
    ---@module 'blink-cmp'
    ---@type blink.cmp.Config
    opts = {
      fuzzy = { implementation = "prefer_rust" },
      signature = { enabled = true },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
        },

        list = {
          selection = {
            preselect = function()
              return not require("blink.cmp").snippet_active({ direction = 1 })
            end,
          },
        },
      },
    },
  },
}
