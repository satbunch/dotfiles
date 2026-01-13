return {
  -- === nvim-autopairs ===
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    config = function()
      local autopairs = require("nvim-autopairs")

      autopairs.setup({
        check_ts = true,
        ts_config = {
          lua = { "string" },
          javascript = { "template_string" },
          java = false,
        },
      })
    end,
  },

  -- === toggleterm.nvim ===
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        direction = "float",
        float_opts = { border = "rounded" },
      })

      local Terminal = require("toggleterm.terminal").Terminal
      local default = Terminal:new({
        direction = "float",
        hidden = true,
      })

      local lazygit = Terminal:new({
        cmd = "lazygit",
        direction = "float",
        hidden = true,
      })

      vim.g.__toggleterm_default = default
      vim.g.__toggleterm_lazygit = lazygit

      vim.keymap.set({ "n", "t" }, "lg", function()
        lazygit:toggle()
      end, { desc = "Toggle Lazygit (float)" })
      vim.keymap.set({ "n", "t" }, "<c-\\>", function()
        default:toggle()
      end, { desc = "Toggle default terminal (float)" })
    end,

    keys = {
      {
        "lg",
        function()
          vim.g.__toggleterm_lazygit:toggle()
        end,
        mode = { "n", "t" },
        desc = "Toggle Lazygit (float)",
      },
      {
        "c-\\",
        function()
          vim.g.__toggleterm_default:toggle()
        end,
        mode = { "n", "t" },
        desc = "Toggle default terminal (float)",
      },
    },
  },
}
