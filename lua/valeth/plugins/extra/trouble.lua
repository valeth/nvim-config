local spec = {
    "folke/trouble.nvim",
}

spec.dependencies = {
    "nvim-tree/nvim-web-devicons",
}

spec.opts = {}

spec.cmd = "Trouble"

spec.keys = {
    { "<Leader>ct", "<cmd>Trouble diagnostics toggle<CR>", desc = "Toggle trouble window" },
}

return spec
