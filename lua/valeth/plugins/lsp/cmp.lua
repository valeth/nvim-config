local spec = {
    "hrsh7th/nvim-cmp",
}

spec.dependencies = {
    "VonHeikemen/lsp-zero.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
}

spec.event = "LspAttach"

spec.config = function()
    local cmp = require("cmp")
    local lspk = require("lspkind")

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup {
        formatting = {
            format = lspk.cmp_format({
                mode = "symbol_text",
            }),
        },
        mapping = {
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
            ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<Tab>"] = nil,
            ["<S-Tab>"] = nil,
        }
    }

end

return spec
