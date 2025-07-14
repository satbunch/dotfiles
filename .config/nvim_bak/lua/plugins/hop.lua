return {
  "phaazon/hop.nvim",
  branch = "v2",
  config = function()
    require("hop").setup({
      multiwindow = true,
    })
  end,
  keys = {
    { mode = "n", "s", "<cmd>HopChar<CR>", desc = "description" },
  },
}
