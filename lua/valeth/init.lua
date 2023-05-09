vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"

vim.g.mapleader = " "

vim.keymap.set("n", "<Leader><CR>", "<cmd>noh<CR>")
vim.keymap.set("n", "U", "<cmd>redo<CR>")
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set({"n", "v"}, "H", "^")
vim.keymap.set({"n", "v"}, "L", "$")
vim.keymap.set({"n", "v", "i"}, "<C-s>", "<cmd>w<CR>")

vim.keymap.set({"n", "v"}, "<F1>", "<NOP>")
vim.keymap.set("n", "s", "<NOP>")


-- Some nice remaps (thanks Prime)

-- Move selected lines up or down
vim.keymap.set("v", "J", ":move '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":move '<-2<CR>gv=gv")

-- Join lines without moving the cursor
vim.keymap.set("n", "J", "mzJ`z")
