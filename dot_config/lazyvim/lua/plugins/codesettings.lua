return {
  ---@type LazySpec
  {
    "mrjones2014/codesettings.nvim",
    lazy = false,
    ---@type CodesettingsConfigSetupInput
    opts = {
      config_file_paths = { ".vscode/settings.json", "codesettings.json", "lspsettings.json" },
      jsonc_filetype = true,
      jsonls_integration = true,
      live_reload = true,
      loader_extensions = { "codesettings.extensions.vscode" },
      lua_ls_integration = true,
      merge_lists = "append",
      nls = true,
      root_dir = nil,
    },
    ---@param opts CodesettingsConfigSetupInput
    config = function(_, opts)
      require("codesettings").setup(opts)
      vim.lsp.config("*", {
        before_init = function(_, config)
          local codesettings = require("codesettings")
          codesettings.with_local_settings(config.name, config, {})
        end,
      })
    end,
  },
}
