local spec = {
    "NeogitOrg/neogit",
}

spec.dependencies = {
    "nvim-lua/plenary.nvim",
}

spec.keys = {
    { "<Leader>vs", "<cmd>Neogit<CR>" },
    { "<Leader>vc", "<cmd>Neogit commit<CR>" },
}

spec.config = true

return spec
