local spec = {
    "NeogitOrg/neogit",
}

spec.dependencies = {
    "nvim-lua/plenary.nvim",
}

spec.keys = {
    { "<Leader>vs",  "<cmd>Neogit<CR>",        desc = "Open NeoGit" },
    { "<Leader>vc",  "<cmd>Neogit commit<CR>", desc = "Open NeoGit commit" },
    { "<Leader>vpu", "<cmd>!git push<CR>",     desc = "Push local commits to upstream" },
}

spec.config = true

return spec
