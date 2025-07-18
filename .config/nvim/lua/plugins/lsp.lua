local function config()
  vim.diagnostic.config({
    underline = true,
    float = {
      source = "if_many",
      format = function(diagnostic)
        if diagnostic.code then
          return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
        else
          return string.format("%s (%ss)", diagnostic.message, diagnostic.source)
        end
      end,
      header = {},
    },
    severity_sort = true,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = " ",
        [vim.diagnostic.severity.HINT] = "",
        [vim.diagnostic.severity.INFO] = "",
      },
    },
    virtual_text = false,
    update_in_insert = true,
  })

  vim.lsp.config("*", {
    ---@param client vim.lsp.Client
    ---@param bufnr number
    on_attach = function(client, bufnr)
      vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })

      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "LSP: [G]oto [d]efinition" })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "LSP: [G]oto [D]eclaration" })

      vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
          vim.diagnostic.open_float(nil, { focus = false })
        end,
      })

      if client.supports_method("textDocument/formatting") then
        vim.keymap.set("n", "==", function()
          vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 3000 })
        end, { buffer = bufnr, desc = "LSP: Document formatting" })

        local fmtag = vim.api.nvim_create_augroup("LspDoumentFormatting", {})
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          group = fmtag,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 3000 })
          end,
        })
      end
    end,
  })
end

return {
  "neovim/nvim-lspconfig",
  ft = { "*" },
  dependencies = {
    { "folke/lazydev.nvim",            ft = { "lua" } },
    { "mason-org/mason-lspconfig.nvim" },
  },
  config = config,
}
