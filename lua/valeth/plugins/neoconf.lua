local spec = {
    "folke/neoconf.nvim",
    tag = "v1.2.2",
}

spec.opts = {
    -- ignore foreign imports
    import = {
        vscode = false,
        coc = false,
        nlsp = false,
    }
}

return spec
