require("neogit").setup({
    -- handled by statuscol
    signs = {
        hunk = { "", "" },
        item = { "", "" },
        section = { "", "" },
    }
})


vim.keymap.set("n", "<Leader>vs", "<cmd>Neogit<CR>", { desc = "Open NeoGit" })
vim.keymap.set("n", "<Leader>vc", "<cmd>Neogit commit<CR>", { desc = "Open NeoGit commit" })
vim.keymap.set("n", "<Leader>vpp", "<cmd>Neogit push<CR>", { desc = "Open NeoGit push" })
vim.keymap.set("n", "<Leader>vpup", "<cmd>!git push<CR>", { desc = "Push local commits to upstream" })
