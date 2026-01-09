return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  opts = {
    theme = "wave",
    dimInactive = true,
    colors = {
      theme = { all = { ui = { bg_gutter = "none" } } },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
