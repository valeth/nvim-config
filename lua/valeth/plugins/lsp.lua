local spec = {
    "neovim/nvim-lspconfig",
}

spec.dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "nvim-telescope/telescope.nvim",
    "folke/neodev.nvim",
}

spec.config = function()
    -- Give me fancy diagnostic signs
    vim.fn.sign_define("DiagnosticSignError ", { text = "✘" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = "▲" })
    vim.fn.sign_define("DiagnosticSignInfo ", { text = "»" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "⚑" })

    vim.diagnostic.config({
        virtual_text = false,
    })

    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })

    mason_lspconfig.setup({
        ensure_installed = {
            "lua_ls",
            "rust_analyzer",
        }
    })

    local lsp_config = require("lspconfig")
    local autocmd = vim.api.nvim_create_autocmd
    local autogroup = vim.api.nvim_create_augroup


    autocmd("LspAttach", {
        group = autogroup("LspAttachConfig", {}),
        callback = function(event)
            local tsb = require("telescope.builtin")
            local opts = { buffer = event.buf, remap = false }

            vim.keymap.set("n", "gd", tsb.lsp_definitions, opts)
            vim.keymap.set("n", "gr", tsb.lsp_references, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<Leader>ci", vim.diagnostic.open_float, opts)
            vim.keymap.set("n", "<Leader>re", vim.lsp.buf.rename, opts)
            vim.keymap.set({ "n", "i" }, "<C-h>", vim.lsp.buf.signature_help, opts)
        end
    })

    require("neodev").setup()

    lsp_config.lua_ls.setup({
        capabilities = {
            textDocument = {
                completion = {
                    completionItem = {
                        snippetSupport = false
                    }
                }
            }
        }
    })

    lsp_config.rust_analyzer.setup({
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
    })
end

return spec
