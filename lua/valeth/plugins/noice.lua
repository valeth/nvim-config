local spec = {
    "folke/noice.nvim",
    tag = "v2.0.0",
}

spec.event = "VeryLazy"

spec.opts = {}

spec.keys = {
    { "<leader>nd", "<cmd>NoiceDismiss<CR>" },
}

spec.dependencies = {
    "MunifTanjim/nui.nvim",
    { "rcarriga/nvim-notify", opts = { top_down = false } },
}

return spec
