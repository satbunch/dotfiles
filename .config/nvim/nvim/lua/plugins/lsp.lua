return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = {},

        -- Rust
        rust_analyzer = {
          cargo = {
            allFeatures = true,
          },
          checkOnSave = {
            command = "clippy",
          },
        },
      },

      setup = {},
    },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "eslint_d",
        "rust-analyzer",
        "codelldb",
        "prettierd",
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
}
