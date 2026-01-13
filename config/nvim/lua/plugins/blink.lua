return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "L3MON4D3/LuaSnip",
  },
  version = "1.*",
  ---@module "blink.cmp"
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "enter",
      ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
    },
    appearance = {
      nerd_font_variant = "mono"
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        draw = {
          treesitter = { "lsp" },
        },
      },
      trigger = {
        completion = {
          keyword_range = 'full',
          keyword_regex = [[\k\+]],
          exclude_from_prefix_regex =
          [[\(\|\)\|\[\|\]\|\{\|\}\|\<\|\>\|=\|+\|-\|\*\|/\|%\|\^\|&\||\|!\|~\|?\|:\|;\|,\|\.\|\'\|\"\|`]],
        },
      },
    },
    snippets = { preset = "luasnip" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        lsp = {
          name = "LSP",
          module = "blink.cmp.sources.lsp",
          enabled = true,
          score_offset = 2,
        },
        path = {
          name = "Path",
          module = "blink.cmp.sources.path",
          score_offset = 1,
          opts = {
            trailing_slash = false,
            label_trailing_slash = true,
            get_cwd = function(context)
              local bufname = vim.api.nvim_buf_get_name(context.bufnr)
              if bufname == "" then
                return vim.fn.getcwd()
              end
              return vim.fn.fnamemodify(bufname, ":h")
            end,
            show_hidden_files_by_default = false,
            max_depth = nil,
            -- React & React Native 両方のファイル拡張子に対応
          }
        },
        snippets = {
          name = "Snippets",
          module = "blink.cmp.sources.snippets",
          score_offset = 0,
        },
        buffer = {
          name = "Buffer",
          module = "blink.cmp.sources.buffer",
          score_offset = -1,
        },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" }
}
