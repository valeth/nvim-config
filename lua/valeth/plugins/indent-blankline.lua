local spec = {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    main = "ibl",
}

spec.opts = {
    scope = {
        show_start = false,
    }
}

return spec
