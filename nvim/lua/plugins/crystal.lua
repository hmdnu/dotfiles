return {
  {
    "andrius/crystal.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = false,
    build = ":TSInstall! crystal",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        crystalline = {
          flags = {
            allow_incremental_sync = false,
          },
          on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        },
      },
    },
  },
}
