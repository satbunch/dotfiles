vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
