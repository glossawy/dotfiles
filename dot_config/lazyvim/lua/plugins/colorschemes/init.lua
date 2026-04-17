return require("utils.lists").concat_new(
  require("plugins.colorschemes.cyberdream"),
  { {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cyberdream",
    },
  } }
)

-- return {
--   require("plugins.colorschemes.cyberdream"),
--   {
--     "LazyVim/LazyVim",
--     ---@module 'lazyvim'
--     ---@type LazyVimOptions
--     opts = {
--       colorscheme = "cyberdream",
--     },
--     config = true,
--   },
-- }
