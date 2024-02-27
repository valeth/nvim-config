local spec = {
    "folke/noice.nvim",
    tag = "v2.0.0",
}

spec.event = "VeryLazy"

spec.opts = {
    presets = {
        command_palette = true,
        lsp_doc_border = true,
    }
}

spec.keys = {
    { "<leader>nd", "<cmd>NoiceDismiss<CR>" },
}

spec.dependencies = {
    "MunifTanjim/nui.nvim",
    { "rcarriga/nvim-notify", opts = { top_down = false } },
}

return spec
