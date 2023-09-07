-- TODO: figure out how to configure auto formatting and drop lsp-zero
local spec = {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
}

spec.dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "mhartington/formatter.nvim",
    "williamboman/mason.nvim",
}

spec.config = function()
    local lsp_zero = require("lsp-zero").preset({})

    -- NOTE: Format on save does not support async formatting
    lsp_zero.format_on_save({
        servers = {
            ["rust_analyzer"] = { "rust" }
        }
    })

    local lsp_config = require("lspconfig")

    lsp_config.lua_ls.setup(lsp_zero.nvim_lua_ls())

    lsp_zero.setup()

    vim.diagnostic.config({
        virtual_text = false,
    })

    -- Gimme pretty icons
    lsp_zero.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
    })
end

return spec
