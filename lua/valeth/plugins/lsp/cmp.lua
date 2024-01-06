local spec = {
    "hrsh7th/nvim-cmp",
}

spec.dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim",
    "L3MON4D3/LuaSnip", -- just here so snippets returned from LSP servers don't throw errors
}

spec.config = function()
    local cmp = require("cmp")
    local lspk = require("lspkind")

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
        formatting = {
            format = lspk.cmp_format({
                mode = "symbol_text",
            })
        },
        window = {
            completion = cmp.config.window.bordered()
        },
        mapping = {
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
            ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
            ["<C-Space>"] = cmp.mapping.complete(),
        },
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "path"},
        })
    })
end

return spec
