local spec = {
    "m4xshen/hardtime.nvim",
}


spec.dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim"
}

spec.opts = {
    disabled_filetypes = { "oil", "lazy", "NeogitStatus" },
}

return spec
