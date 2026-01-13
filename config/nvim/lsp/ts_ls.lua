---@type vim.lsp.Config
return {
  init_options = {
    preferences = {
      includePackageJsonAutoImports = "auto",
      includeCompletionsForModuleExports = true,
      includeCompletionsWithInsertText = true,
      includeAutomaticOptionalChainCompletions = true,
      includeCompletionsForImportStatements = true,
      allowIncompleteCompletions = true,
      -- プロジェクトタイプに応じて自動調整
      importModuleSpecifier = "relative",
      quotePreference = "auto",
    },
  },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "literal",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
      suggest = {
        includeCompletionsForModuleExports = true,
        includeCompletionsForImportStatements = true,
        includeAutomaticOptionalChainCompletions = true,
        autoImports = true,
      },
      preferences = {
        includePackageJsonAutoImports = "auto",
        allowIncompleteCompletions = true,
        -- プロジェクトタイプに応じて動的に変更される
        importModuleSpecifier = "relative",
        quotePreference = "auto",
      },
      format = {
        enable = true,
      },
      validate = {
        enable = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
      suggest = {
        includeCompletionsForModuleExports = true,
        includeCompletionsForImportStatements = true,
        includeAutomaticOptionalChainCompletions = true,
        autoImports = true,
      },
      preferences = {
        includePackageJsonAutoImports = "auto",
        allowIncompleteCompletions = true,
        importModuleSpecifier = "relative",
        quotePreference = "auto",
      },
      format = {
        enable = true,
      },
      validate = {
        enable = true,
      },
    },
  },
}
