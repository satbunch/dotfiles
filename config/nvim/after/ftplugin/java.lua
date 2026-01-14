-- タブ設定
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = true

-- 以下が起動スクリプト
local jdtls_setup = require("jdtls.setup")
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = jdtls_setup.find_root(root_markers)
if not root_dir then
  return
end

local home = os.getenv("HOME")
local jdtls_path = home .. "/.local/share/nvim/mason/packages/jdtls"
local config_dir = jdtls_path .. "/config_mac" -- if you use linux /config_linux
local launcher_path = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = home .. "/.cache/jdtls/workspace/" .. project_name

local lombok_path = vim.fn.glob(jdtls_path .. "/lombok.jar")

-- LSP capabilities with nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local java21_home = home .. "/.sdkman/candidates/java/21.0.9-amzn"
local java17_home = home .. "/.sdkman/candidates/java/17.0.12-amzn"

local config = {
  cmd = {
    java21_home .. "/bin/java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-javaagent:" .. lombok_path,
    "-jar",
    launcher_path,
    "-configuration",
    config_dir,
    "-data",
    workspace_dir,
  },
  root_dir = root_dir,
  capabilities = capabilities,
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-17",
            path = java17_home,
            default = true,
          },
          {
            name = "JavaSE-21",
            path = java21_home,
          },
        },
      },
      import = {
        gradle = {
          enabled = true, -- Gradleサポートを有効化
        },
        maven = {
          enabled = true, -- Mavenサポートを有効化
        },
      },
      signatureHelp = { enabled = true },
    },
  },
  init_options = {
    bundles = {},
    extendedClientCapabilities = jdtls_setup.extendedClientCapabilities,
  },
}
jdtls_setup.start_or_attach(config)
