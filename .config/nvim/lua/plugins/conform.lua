return {
  "stevearc/conform.nvim",
  -- LazyVim と互換性を保つため `opts = function()` を使う
  opts = function()
    ---@type conform.setupOpts
    local opts = {
      -- 保存時に整形する設定（LazyVimのスタイル）
      format_on_save = function(bufnr)
        local utils = require("conform.util")
        return utils.root_has_file({
          ".eslintrc.js",
          ".eslintrc.cjs",
          ".eslintrc.json",
          ".eslintrc",
          "package.json", -- 任意で追加（eslintConfig がある場合）
        })
      end,

      -- 整形オプション（タイムアウトなど）
      default_format_opts = {
        timeout_ms = 5000,
        async = false,
        quiet = false,
        lsp_format = "fallback",
      },

      -- ファイルタイプごとの formatter 設定
      formatters_by_ft = {
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "prettier", "eslint_d" },
        vue = { "eslint_d" },
        lua = { "stylua" },
        sh = { "shfmt" },
      },

      -- formatter 単体ごとの詳細設定
      formatters = {
        eslint_d = {
          condition = function(ctx)
            return vim.fs.find({
              ".eslintrc.js",
              ".eslintrc.cjs",
              ".eslintrc.json",
              ".eslintrc",
            }, { upward = true, path = ctx.filename })[1]
          end,
        },
      },
    }

    return opts
  end,
}
