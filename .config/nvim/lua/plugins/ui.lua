return {
  -- === telescope ====
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = function(_, opts)
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      })
    end,
  },

  -- === lualine ===
  {
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
              symbols = { added = " ", modified = " ", removed = " " },
              separator = "  |  ",
            },
            {
              "diagnostics",
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
            },
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
  },

  -- === bufferlinelnvim ===
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    opts = {
      options = {
        mode = "bufferline",
        separator_style = "slant",
      },
    },
  },

  -- === noice.nvim ===
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        progress = { enabled = false },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
    },
  },
}
