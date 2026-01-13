return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}

      vim.list_extend(opts.ensure_installed, {
        "lua",
        "vim",
        "vimdoc",

        "bash",

        "html",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "yaml",
        "toml",

        "rust",

        "markdown",
        "markdown_inline",
        "query",
        "regex",

        "python",
      })

      opts.highlight = opts.highlight or {}
      opts.highlight.enable = true
    end,
  },
}
