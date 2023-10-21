local spec = {
    "neovim/nvim-lspconfig",
}

spec.dependencies = {
    "nvim-telescope/telescope.nvim",
    "folke/neodev.nvim",
}

spec.config = function()
    local lsp_config = require("lspconfig")
    local tsb = require("telescope.builtin")
    local autocmd = vim.api.nvim_create_autocmd
    local autogroup = vim.api.nvim_create_augroup

    autocmd("LspAttach", {
        group = autogroup("LspAttachConfig", {}),
        callback = function(event)
            local opts = { buffer = event.buf, remap = false }

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
        end
    })

    require("neodev").setup()

    lsp_config.lua_ls.setup {
        settings = {
            Lua = {
                completion = {
                    callSnippet = "Replace"
                }
            }
        }
    }

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
end

return spec
