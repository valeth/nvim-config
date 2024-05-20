local spec = {
    "neovim/nvim-lspconfig",
}

spec.dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "nvim-telescope/telescope.nvim",
    "folke/neodev.nvim",
    "folke/neoconf.nvim",
}

local function rust_analyzer_setup(lsp_config)
    local rust_analyzer_settings = {
        cargo = {
            features = "all"
        },
    }

    -- Don't have rustup available if using nix shell
    if vim.fn.executable("rustup") == 1 then
        rust_analyzer_settings = vim.tbl_extend("keep", rust_analyzer_settings, {
            rustfmt = { extraArgs = { "+nightly" } }
        })
    end

    lsp_config.rust_analyzer.setup({
        settings = {
            ["rust-analyzer"] = rust_analyzer_settings
        }
    })
end

local function lua_ls_setup(lsp_config)
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
end

spec.config = function()
    local neoconf = require("neoconf")

    neoconf.setup({
        -- ignore foreign imports
        import = {
            vscode = false,
            coc = false,
            nlsp = false,
        }
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

    lua_ls_setup(lsp_config)

    rust_analyzer_setup(lsp_config)

    lsp_config.sqlls.setup({})

    lsp_config.nil_ls.setup({})
end

return spec
