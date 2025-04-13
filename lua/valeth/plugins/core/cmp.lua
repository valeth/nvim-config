local keymap = vim.keymap.set

local spec = {
    "hrsh7th/nvim-cmp",
}

spec.dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim",
    "L3MON4D3/LuaSnip", -- just here so snippets returned from LSP servers don't throw errors
}

local function autocompletion_enabled()
    local cmp = require("cmp")
    local trigger_event = cmp.TriggerEvent.TextChanged
    return vim.tbl_contains(cmp.get_config().completion.autocomplete or {}, trigger_event)
end

local function toggle_autocompletion()
    local cmp = require("cmp")
    if autocompletion_enabled() then
        cmp.get_config().completion.autocomplete = false
    else
        cmp.get_config().completion.autocomplete = { cmp.TriggerEvent.TextChanged }
    end
end

spec.config = function()
    local cmp = require("cmp")
    local lspk = require("lspkind")

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
        -- Only trigger completion explicitly through keymapping, or when toggled
        completion = {
            autocomplete = false
        },
        ---@diagnostic disable-next-line:missing-fields
        formatting = {
            format = lspk.cmp_format({
                mode = "symbol_text",
            })
        },
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end
        },
        window = {
            completion = cmp.config.window.bordered()
        },
        mapping = {
            ["<C-y>"] = cmp.mapping.confirm({ select = true }),
            ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
            ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
            ["<C-Space>"] = cmp.mapping.complete(),
        },
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "path" },
        })
    })

    keymap("n", "<Leader>cc", toggle_autocompletion, { desc = "Toggle autocompletion" })
end


return spec
