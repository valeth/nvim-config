local spec = {
    "folke/zen-mode.nvim"
}

spec.opts = {}

spec.keys = {
    { "<Leader>zz", "<cmd>ZenMode<CR>", desc = "Toggle Zen mode" },
}

return spec
