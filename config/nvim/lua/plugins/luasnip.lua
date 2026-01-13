local function config()
  local snip = require("luasnip")
  snip.filetype_extend("typescript", { "javascript" })
  snip.filetype_extend("bash", { "zsh" })
  snip.filetype_extend("ruby", { "rails" })

  require("luasnip.loaders.from_vscode").lazy_load()
  require("luasnip.loaders.from_lua").lazy_load()
end

return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  dependencies = "rafamadriz/friendly-snippets",
  config = config,
}
