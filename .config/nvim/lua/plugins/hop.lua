return {
  "phaazon/hop.nvim",
  branch = "v2",
  config = function()
    require("hop").setup({
      multiwindow = true,
    })
  end,
  keys = {
    { mode = "", "s", "<cmd>HopChar<CR>", desc = "description" },
  },
}
