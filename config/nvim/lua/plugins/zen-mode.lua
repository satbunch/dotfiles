return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      backdrop = 0.95,     -- 背景の暗さ
      width = 120,         -- ウィンドウの幅
      options = {
        signcolumn = "no", -- サインカラム非表示
        number = false,
        relativenumber = false,
        cursorline = false,
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = false,
      },
      gitsigns = { enabled = false },
      tmux = { enabled = false },
    },
  },
  keys = {
    { "<leader>z", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
  },
}
