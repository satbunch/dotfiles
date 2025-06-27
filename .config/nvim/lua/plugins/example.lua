-- stylua: ignore
if true then return {} end

-- プラグイン定義（Lazy.nvim用）
-- ファイル単位で自動読み込みされる

return {

  -- 🔧 Trouble: 診断表示プラグイン（設定変更）
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },

  -- 😀 補完（nvim-cmp + emoji対応 + supertab対応）
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      -- emojiソースを追加
      table.insert(opts.sources, { name = "emoji" })

      -- supertabのキーマッピングを上書き
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },

  -- LuaSnip: デフォルトの <Tab> を無効化
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },

  -- 🧠 LSP設定（lspconfig + mason + 各言語別設定）
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- TypeScript専用設定サポート
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
    opts = {
      servers = {
        pyright = {},
        tsserver = {},
        rust_analyzer = {}, -- 追加済みのrust-analyzer設定
      },
      setup = {
        -- TypeScript用に typescript.nvim を使用
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
  },

  -- Mason：LSP以外のCLIツールを自動インストール
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

  -- 📊 ステータスラインに絵文字追加
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, "😄")
    end,
  },

  -- 🎉 スタート画面：alphaの代わりにmini.starterを使用
  {
    import = "lazyvim.plugins.extras.ui.mini-starter",
  },
}
