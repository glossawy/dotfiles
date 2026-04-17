local blink = require("plugins.blink-cmp.utils")

local conventional_commits = blink.sources.new("conventional_commits", "disrupted/blink-cmp-conventional-commits", {
  name = "Conventional Commits",
  module = "blink-cmp-conventional-commits",
  enabled = function()
    return vim.bo.filetype == "gitcommit"
  end,
  opts = {},
})

local ripgrep = blink.sources.new("ripgrep", {
  "mikavilpas/blink-ripgrep.nvim",
  version = "*",
}, {
  name = "Ripgrep",
  module = "blink-ripgrep",
  ---@module "blink-ripgrep"
  ---@type blink-ripgrep.Options
  opts = {
    backend = {
      use = "gitgrep-or-ripgrep",
    },
  },
})

local ghostty = blink.sources.new("ghostty", "barrettruth/blink-cmp-ghostty", {
  name = "Ghostty",
  module = "blink-cmp-ghostty",
})

local lsp_doc_symbols = blink.sources.new("nvim_lsp_document_symbol", "hrsh7th/cmp-nvim-lsp-document-symbol", {
  name = "LSP Document Symbol",
  module = "cmp-nvim-lsp-document-symbol", -- overwritten by compat
})

return {
  {
    "saghen/blink.compat",
    optional = true,
    version = "2.*",
    lazy = true,
    opts = {},
  },

  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = { "saghen/blink.compat" },
  },

  conventional_commits:as_spec(),
  ripgrep:as_spec(),
  ghostty:as_spec(),
  lsp_doc_symbols:as_compat():as_spec(),
}
