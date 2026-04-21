---@module 'lazy'
---@type LazySpec[]
return {
  {
    "josephburgess/nvumi",
    lazy = false,
    keys = {
      { "<leader>N", "<cmd>Nvumi<CR>", desc = "Nvumi Buffer", mode = "n" },
    },
    config = true,
    ---@module 'nvumi'
    ---@type nvumi.Options
    opts = {
      virtual_text = "newline",
      prefix = " = ",
      date_format = "iso",
      width = 0.6,
      height = 0.6,
      keys = {
        run = "<CR>",
        reset = "<leader>R",
        yank = "<leader>y",
        yank_all = "<leader>Y",
      },
      custom_conversions = {},
      custom_functions = {},
    },
  },
}
