local spec = {
    "jay-babu/mason-nvim-dap.nvim",
    tag = "v2.2.0",
}

spec.opts = {
    ensure_installed = { "codelldb" },
    handlers = {},
}

spec.dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
}

spec.ft = { "rust" }

return spec
