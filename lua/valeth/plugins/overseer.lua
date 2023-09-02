local spec = {
    "stevearc/overseer.nvim",
    opts = {},
}

spec.dependencies = {
    "nvim-telescope/telescope.nvim",
    "stevearc/dressing.nvim",
}

spec.keys = {
    {
        "<Leader>xr",
        "<cmd>OverseerRun<CR>",
        mode = "n"
    },
    {
        "<Leader>xl",
        "<cmd>OverseerToggle<CR>",
        mode = "n"
    },
}

return spec
