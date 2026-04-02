local spec = {
    "NeogitOrg/neogit",
}

spec.dependencies = {
    "nvim-lua/plenary.nvim",
}

spec.keys = {
    { "<Leader>vs",   "<cmd>Neogit<CR>",        desc = "Open NeoGit" },
    { "<Leader>vc",   "<cmd>Neogit commit<CR>", desc = "Open NeoGit commit" },
    { "<Leader>vpp",  "<cmd>Neogit push<CR>",   desc = "Open NeoGit push" },
    { "<Leader>vpup", "<cmd>!git push<CR>",     desc = "Push local commits to upstream" },
}

spec.opts = {
    -- handled by statuscol
    signs = {
        hunk = { "", "" },
        item = { "", "" },
        section = { "", "" },
    }
}

return spec
