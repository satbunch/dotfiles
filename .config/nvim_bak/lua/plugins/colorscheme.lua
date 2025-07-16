return {
  "rebelot/kanagawa.nvim",
  lazy = true,
  priority = 1000,
  opts = function()
    return {
      dimInactive = true,
      colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
    }
  end,
}
