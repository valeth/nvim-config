require("flash").setup({})

vim.keymap.set("n", "<Leader>j", function() require("flash").jump() end, { desc = "Jump to location" })
vim.keymap.set("n", "<Leader>s", function() require("flash").treesitter() end, { desc = "Select area" })
