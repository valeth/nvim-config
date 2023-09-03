local spec = {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
}

spec.dependencies = {
    "neovim/nvim-lspconfig",
    -- completion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim",
    -- formatting
    "mhartington/formatter.nvim",
    -- snippets
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    -- lsp manager
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- code folding
    "kevinhwang91/nvim-ufo",
    "kevinhwang91/promise-async",
}

spec.config = function()
    local lsp_zero = require("lsp-zero").preset({})
    local ufo = require("ufo")
    local tsb = require("telescope.builtin")

    lsp_zero.ensure_installed {
        "lua_ls",
        "rust_analyzer",
    }

    lsp_zero.on_attach(function(_, buffnr)
        local opts = { buffer = buffnr, remap = false }

        ufo.attach(buffnr)

        vim.keymap.set("n", "gd", tsb.lsp_definitions, opts)
        vim.keymap.set("n", "gr", tsb.lsp_references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<Leader>ci", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<Leader>re", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "i" }, "<C-h>", vim.lsp.buf.signature_help, opts)

        vim.keymap.set("n", "<Leader>fmt", function()
            vim.lsp.buf.format({ async = false, timeout_ms = 5000 })
        end)
    end)


    -- NOTE: Format on save does not support async formatting
    lsp_zero.format_on_save({
        servers = {
            ["rust_analyzer"] = { "rust" }
        }
    })

    local lsp_config = require("lspconfig")

    lsp_config.lua_ls.setup(lsp_zero.nvim_lua_ls())

    lsp_config.rust_analyzer.setup {
        settings = {
            ["rust-analyzer"] = {
                cargo = {
                    features = "all"
                },
                rustfmt = {
                    -- needs to use nightly channel to use unstable options
                    extraArgs = { "+nightly" }
                }
            }
        }
    }

    ufo.setup {
        close_fold_kinds = {"comment", "imports"},
    }

    lsp_zero.setup()

    local cmp = require("cmp")
    local lspk = require("lspkind")

    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    cmp.setup {
        formatting = {
            format = lspk.cmp_format({}),
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