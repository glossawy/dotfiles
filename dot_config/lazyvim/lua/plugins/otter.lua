return {
  {
    "jmbuhr/otter.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = true,
    ---@module 'otter'
    ---@type OtterConfig
    opts = {
      debug = false,
      extensions = {},
      injectable_languages = {
        "ruby",
        "python",
        "lua",
        "sql",
        "msql",
        "mysql",
      },
      lsp = {
        diagnostic_update_events = { "BufWritePost" },
        root_dir = function(_, bufnr)
          return vim.fs.root(bufnr or 0, {
            ".git",
            ".vscode",
            ".zed",
            "_quarto.yml",
            "package.json",
            "CLAUDE.md",
          }) or vim.fn.getcwd(0)
        end,
      },

      buffers = {
        set_filetype = true,
        write_to_disk = false,
        preambles = {},
        postambles = {},
        ignore_pattern = {
          python = "^(%s*[%%!].*)",
        },
      },

      handle_leading_whitespace = true,
      verbose = {
        no_code_found = false,
      },
    },
  },
}
