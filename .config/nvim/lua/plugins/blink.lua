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
      ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' }, -- 補完候補とスニペット両方
      ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
    },
    appearance = {
      nerd_font_variant = "mono"
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      }
    },
    snippets = { preset = "luasnip" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" }
}
