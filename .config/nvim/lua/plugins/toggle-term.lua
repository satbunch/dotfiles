return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup()
    local Terminal = require("toggleterm.terminal").Terminal
    local default = Terminal:new {
      direction = "float",
      hidden = true,
    }
    local lazygit = Terminal:new {
      cmd = "lazygit",
      direction = "float",
      hidden = true,
    }
    vim.keymap.set({ "n", "t" }, "lg", function()
      lazygit:toggle()
    end, { desc = "Toggle Lazygit (float)" })
    vim.keymap.set({ "n", "t" }, "<c-\\>", function()
      default:toggle()
    end, { desc = "Toggle default terminal (float)" })
  end,
}
