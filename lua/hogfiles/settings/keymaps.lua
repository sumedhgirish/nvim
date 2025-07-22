local map = vim.keymap.set

-- Ease of life
map("i", "jk", "<ESC>", { desc = "Normal Mode" })
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Moving between windows
map("n", "<C-h>", "<C-w>h", { desc = "move left" })
map("n", "<C-l>", "<C-w>l", { desc = "move right" })
map("n", "<C-j>", "<C-w>j", { desc = "move down" })
map("n", "<C-k>", "<C-w>k", { desc = "move up" })

-- Directory listing
map("n", ".", "<cmd>lua require('oil').toggle_float()<CR>", { noremap = true, silent = true })

-- Menus
map("n", "ml","<cmd>Lazy<CR>", { noremap = true, silent = true, desc = "Lazy" })
map("n", "mm", "<cmd>Mason<CR>", { noremap = true, silent = true, desc = "Mason" })
