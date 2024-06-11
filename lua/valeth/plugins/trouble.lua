local spec = {
    "folke/trouble.nvim",
}

spec.dependencies = {
    "nvim-tree/nvim-web-devicons",
}

spec.keys = {
    { "<Leader>ct", "<cmd>TroubleToggle<CR>", desc = "Toggle trouble window" },
}

return spec
