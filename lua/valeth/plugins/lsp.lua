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

local function toggle_inlay_hints()
    -- the docs suggest this, so this should be fine
    ---@diagnostic disable-next-line: missing-parameter
    local to_enable = not vim.lsp.inlay_hint.is_enabled()
    vim.lsp.inlay_hint.enable(to_enable)
    local status = to_enable and "enabled" or "disabled"
    vim.notify("Inlay hints " .. status, vim.log.levels.INFO)
end

---@param buf buffer
---@param mode string | string[]
---@param rhs string
---@param lhs string | function
---@param desc? string
local function bufmap(buf, mode, rhs, lhs, desc)
    local opts = {
        buffer = buf,
        remap = false,
        desc = desc
    }

    vim.keymap.set(mode, rhs, lhs, opts)
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
            local buf = event.buf
            bufmap(buf, "n", "gd", tsb.lsp_definitions, "Go to definition")
            bufmap(buf, "n", "gr", tsb.lsp_references, "Go to reference")
            bufmap(buf, "n", "K", vim.lsp.buf.hover, "Show documentation in hover")
            bufmap(buf, "n", "<Leader>ca", vim.lsp.buf.code_action, "Run a code action")
            bufmap(buf, "n", "<Leader>ci", vim.diagnostic.open_float, "Show diagnostics")
            bufmap(buf, "n", "<Leader>re", vim.lsp.buf.rename, "Rename item under cursor")
            bufmap(buf, { "n", "i" }, "<C-h>", vim.lsp.buf.signature_help, "Open signature help")
            bufmap(buf, "n", "<C-i>", toggle_inlay_hints, "Toggle LSP inlay hints")
        end
    })

    require("neodev").setup()

    lua_ls_setup(lsp_config)

    rust_analyzer_setup(lsp_config)

    lsp_config.sqlls.setup({})

    lsp_config.nil_ls.setup({})

    lsp_config.ruby_lsp.setup({})
end

return spec
