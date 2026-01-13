local function detect_project_type()
  local cwd = vim.fn.getcwd()
  local package_json = cwd .. "/package.json"

  if vim.fn.filereadable(package_json) == 1 then
    local package_content = vim.fn.readfile(package_json)
    local package_str = table.concat(package_content, "\n")

    -- React Native/Expo プロジェクトの検出
    if string.match(package_str, '"react%-native"') or
        string.match(package_str, '"expo"') or
        vim.fn.filereadable(cwd .. "/app.json") == 1 or
        vim.fn.filereadable(cwd .. "/app.config.js") == 1 then
      vim.g.project_type = "react-native"
      print("React Native/Expo project detected")

      -- Next.js プロジェクトの検出
    elseif string.match(package_str, '"next"') or
        vim.fn.filereadable(cwd .. "/next.config.js") == 1 then
      vim.g.project_type = "nextjs"
      print("Next.js project detected")

      -- Vite プロジェクトの検出
    elseif string.match(package_str, '"vite"') or
        vim.fn.filereadable(cwd .. "/vite.config.js") == 1 or
        vim.fn.filereadable(cwd .. "/vite.config.ts") == 1 then
      vim.g.project_type = "vite"
      print("Vite project detected")

      -- CRA (Create React App) プロジェクトの検出
    elseif string.match(package_str, '"react%-scripts"') then
      vim.g.project_type = "cra"
      print("Create React App project detected")

      -- 一般的なReact プロジェクトの検出
    elseif string.match(package_str, '"react"') then
      vim.g.project_type = "react"
      print("React project detected")
    else
      vim.g.project_type = "general"
    end
  else
    vim.g.project_type = "general"
  end
end

-- プロジェクトタイプに応じた設定適用
local function apply_project_settings()
  local project_type = vim.g.project_type or "general"

  if project_type == "react-native" then
    -- React Native固有の設定
    vim.opt.suffixesadd:append({ '.ios.tsx', '.android.tsx', '.native.tsx' })
  elseif project_type == "nextjs" then
    -- Next.js固有の設定
    vim.opt.suffixesadd:append({ '.client.tsx', '.server.tsx' })
  elseif project_type == "vite" or project_type == "cra" or project_type == "react" then
    -- React Web固有の設定
    vim.opt.suffixesadd:append({ '.tsx', '.ts', '.jsx', '.js' })
  end
end

-- オートコマンドの設定
vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
  callback = function()
    detect_project_type()
    apply_project_settings()
  end,
})

-- ファイルタイプ固有の設定
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  callback = function()
    local project_type = vim.g.project_type or "general"

    -- プロジェクトタイプに応じたキーマップやコマンドを設定
    if project_type == "react-native" then
      -- React Native開発用のキーマップ
      vim.keymap.set("n", "<leader>rr", ":!npx react-native run-ios<CR>",
        { buffer = true, desc = "Run on iOS simulator" })
      vim.keymap.set("n", "<leader>ra", ":!npx react-native run-android<CR>",
        { buffer = true, desc = "Run on Android emulator" })
    elseif project_type == "nextjs" then
      -- Next.js開発用のキーマップ
      vim.keymap.set("n", "<leader>rd", ":!npm run dev<CR>",
        { buffer = true, desc = "Start Next.js dev server" })
    elseif project_type == "vite" then
      -- Vite開発用のキーマップ
      vim.keymap.set("n", "<leader>rd", ":!npm run dev<CR>",
        { buffer = true, desc = "Start Vite dev server" })
    end
  end,
})
