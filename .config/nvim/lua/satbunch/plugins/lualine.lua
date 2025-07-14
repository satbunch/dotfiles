return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    lualine.setup({
      options = {
        theme = "auto",
        globalstatus = true,
        icons_enabled = true,
      },
      sections = {
        lualine_a = { "branch" },
        lualine_b = {
          {
            function()
              local filepath = vim.fn.expand("%:.")
              local filename = vim.fn.expand("%:t")
              return filepath:gsub("/" .. vim.pesc(filename) .. "$", "")
            end,
            icon = "",
          },
          {
            function()
              return vim.fn.expand("%:t")
            end,
            color = { gui = "bold" },
          },
        },
        lualine_c = {
          "'%='",
          {
            "diff",
            symbols = {added = ' ', modified = ' ', removed = ' '},
            separator = "  |  ",
          },
          {
            "diagnostics",
            symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
          }
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          "encoding",
          "fileformat",
          "filetype",
        },
      },
    })
  end,
}
