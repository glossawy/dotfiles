return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    ---@module 'cyberdream'
    ---@type cyberdream.Config
    opts = {
      variant = "auto",
      transparent = true,
      saturation = 0.8,
      italic_cmments = true,
      extensions = {
        default = false,

        fzflua = true,

        gitpad = true,
        gitsigns = true,

        indentblankline = true,
        lazy = true,
        mini = true,
        noice = true,
        rainbow_delimiters = true,
        markdown = true,
        markview = true,

        blinkcmp = true,
        snacks = true,
        treesitter = true,
        telescope = true,
        treesittercontext = true,
        trouble = true,
        whichkey = true,
      },
    },
    config = true,
  },
}
