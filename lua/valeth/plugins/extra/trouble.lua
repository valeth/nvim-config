require("trouble").setup({
    focus = true
})

vim.keymap.set("n", "<Leader>ct", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Toggle trouble window" })
