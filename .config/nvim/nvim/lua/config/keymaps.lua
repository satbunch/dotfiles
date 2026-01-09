local function keymap(mode, keys, cmd, opts)
  vim.keymap.set(
    mode,
    keys,
    cmd,
    vim.tbl_extend("force", {
      noremap = true,
      silent = true,
    }, opts or {})
  )
end

-- Change Normal Mode
keymap("i", "jj", "<Esc>", { desc = "Exit insert mode with jj" })

-- Disable CommandLine Wihdow
keymap("n", "q:", "<nop>", { desc = "Disable cmdwin" })

-- Disable Search Highlight
keymap("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>", { desc = "Disable search highlight" })

--
keymap("n", "<C-j>", "10j", { desc = "Quickly jump 10 lines down" })
keymap("n", "<C-k>", "10k", { desc = "Quickly jump 10 lines up" })

-- Increment/Decrement
keymap("n", "+", "<C-a>", { desc = "Increment number" })
keymap("n", "-", "<C-x>", { desc = "Decrement number" })

-- Select All
keymap("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- -- Tab managemant
-- keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
-- keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
-- keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
-- keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
-- keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Split window
keymap("n", "<leader>ss", "<cmd>split<CR>", { desc = "Split window hirizontally" })
keymap("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split window vertically" })
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Move window
keymap("n", "<leader>sh", "<C-w>h", { desc = "Move left window" })
keymap("n", "<leader>sk", "<C-w>k", { desc = "Move up window" })
keymap("n", "<leader>sj", "<C-w>j", { desc = "Move down window" })
keymap("n", "<leader>sl", "<C-w>l", { desc = "Move right window" })
