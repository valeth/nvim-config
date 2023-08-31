local map = vim.keymap.set

map("n", "<Leader><CR>", "<cmd>noh<CR>")
map("n", "U", "<cmd>redo<CR>")
map("n", "Y", "y$")
map("n", "j", "gj")
map("n", "k", "gk")

map({"n", "v"}, "H", "^")
map({"n", "v"}, "L", "$")

map({"n", "v", "i"}, "<C-s>", "<cmd>w<CR>")
map("n", "s", "<NOP>")

-- Exit insert mode by quickly pressing jk
map("i", "jk", "<ESC>")

-- This avoids accidentially recording a macro
map({"n", "v"}, "<F1>", "q")
map({"n", "v"}, "q", "<NOP>")

-- Move selected lines up or down
map("v", "J", ":move '>+1<CR>gv=gv")
map("v", "K", ":move '<-2<CR>gv=gv")

-- Join lines without moving the cursor
map("n", "J", "mzJ`z")
