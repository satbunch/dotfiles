return {
  -- lsp 基本設定
  {
    "neovim/nvim-lspconfig",

    opts = {
      -- 各サーバーごとの追加設定を setup に記述
      setup = {
        lua_ls = function(_, opts)
          opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
            Lua = {
              workspace = {
                library = {
                  vim.fn.stdpath("data") .. "/lazy/conform.nvim",
                  vim.fn.stdpath("data") .. "/lazy/typescript.nvim",
                },
              },
              diagnostics = {
                globals = { "vim" },
              },
            },
          })
          return false -- lazyvim 側の setup をそのまま実行させる
        end,

        -- typescript 用に typescript.nvim を使用
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true -- lazyvim 側で再 setup させない
        end,
      },

      -- lsp サーバーごとの基本設定
      servers = {
        pyright = {},
        tsserver = {},
        rust_analyzer = {},
        -- lua_ls の初期設定は lazyvim 側に任せるのでここには書かない
      },
    },

    dependencies = {
      -- typescript 用プラグイン
      {
        "jose-elias-alvarez/typescript.nvim",
        init = function()
          require("lazyvim.util").lsp.on_attach(function(_, buffer)
            vim.keymap.set(
              "n",
              "<leader>co",
              "typescriptorganizeimports",
              { buffer = buffer, desc = "organize imports" }
            )
            vim.keymap.set("n", "<leader>cr", "typescriptrenamefile", { buffer = buffer, desc = "rename file" })
          end)
        end,
      },
    },
  },

  -- cli ツール系 (mason で管理)
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
}
