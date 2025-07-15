return {
  "mason-org/mason-lspconfig.nvim",
  lazy = true,
  dependencies = {
    "mason-org/mason.nvim",
  },
  config = function()
    local servers = {
      "bashls",
			"dockerls",
			"eslint",
			"html",
			"jsonls",
			"lua_ls",
			"pyright",
			"ruff",
			"rubocop",
			"rust_analyzer",
			-- "solargraph",
			"ruby_lsp",
			"sqlls",
			"tailwindcss",
			"ts_ls",
			-- cSpell:enable
    }

    require("mason-lspconfig").setup({
      automatic_enable = true,
      ensure_installed = servers,
    })

  end,
}
