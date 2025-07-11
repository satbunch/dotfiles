return {
  -- LSP 基本設定
  {
    "neovim/nvim-lspconfig",

    opts = {
      -- 各サーバーごとの追加設定を setup に記述
      setup = {
        lua_ls = function(_, opts)
          opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          })
          return false -- LazyVim 側の setup をそのまま実行させる
        end,

        -- TypeScript 用に typescript.nvim を使用
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true -- LazyVim 側で再 setup させない
        end,
      },

      -- LSP サーバーごとの基本設定
      servers = {
        pyright = {},
        tsserver = {},
        rust_analyzer = {},
        -- lua_ls の初期設定は LazyVim 側に任せるのでここには書かない
      },
    },

    dependencies = {
      -- TypeScript 用プラグイン
      {
        "jose-elias-alvarez/typescript.nvim",
        init = function()
          require("lazyvim.util").lsp.on_attach(function(_, buffer)
            vim.keymap.set(
              "n",
              "<leader>co",
              "TypescriptOrganizeImports",
              { buffer = buffer, desc = "Organize Imports" }
            )
            vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { buffer = buffer, desc = "Rename File" })
          end)
        end,
      },
    },
  },

  -- CLI ツール系 (mason で管理)
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

  -- lazydev.nvim & luvit-meta (Lua 開発補完強化)
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true },
}
