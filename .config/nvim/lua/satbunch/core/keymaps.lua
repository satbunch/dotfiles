vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Change Normal Mode
keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode with jj" })

-- Increment/Decrement
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Select All
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Tab managemant
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Split window
keymap.set("n", "<leader>ss", "<cmd>split<CR>", opts, { desc = "Split window hirizontally" })
keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", opts, { desc = "Split window vertically" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Move window
keymap.set("n", "<leader>sh", "<C-w>h", { desc = "Move left window" })
keymap.set("n", "<leader>sk", "<C-w>k", { desc = "Move up window" })
keymap.set("n", "<leader>sj", "<C-w>j", { desc = "Move down window" })
keymap.set("n", "<leader>sl", "<C-w>l", { desc = "Move right window" })

-- Float error comment
-- keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "" })
-- keymap.set("n", "[d", function()
--   vim.diagnostic.jump({ count = 1, float = true })
-- end)
-- keymap.set("n", "]d", function()
--   vim.diagnostic.jump({ count = -1, float = true })
-- end)
