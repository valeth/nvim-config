local spec = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    "folke/neoconf.nvim",
}

spec.config = function()
    require("mason").setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })

    require("neoconf").setup({
        import = {
            vscode = false,
            coc = false,
            nlsp = false,
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


local autocmd = vim.api.nvim_create_autocmd
local autogroup = vim.api.nvim_create_augroup

---@param buf integer
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
        bufmap(buf, "n", "<Leader>ch", toggle_inlay_hints, "Toggle LSP inlay hints")
    end
})


local lsp_configs = {}

lsp_configs["rust_analyzer"] = {
    settings = {
        cargo = {
            features = "all"
        },
        checkOnSave = true,
    }
}

if vim.fn.executable("cargo-clippy") == 1 then
    lsp_configs.rust_analyzer.settings.check = { command = "clippy" }
end

-- Don't have rustup available if using nix shell
if vim.fn.executable("rustup") == 1 then
    lsp_configs.rust_analyzer.settings = vim.tbl_extend("keep", lsp_configs.rust_analyzer.settings, {
        rustfmt = { extraArgs = { "+nightly" } }
    })
end

lsp_configs["lua_ls"] = {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("**/*.lua", true)
            }
        }
    },
    capabilities = {
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = false
                }
            }
        }
    }
}

lsp_configs["nushell"] = {
    cmd = { "nu", "--no-config-file", "--lsp" },
}

lsp_configs["nil_ls"] = {}
lsp_configs["ruby_lsp"] = {}
lsp_configs["denols"] = {}
lsp_configs["qmlls"] = {}


for lsp, config in pairs(lsp_configs) do
    -- cursed table empty check
    if next(config) ~= nil then
        vim.lsp.config(lsp, config)
    end
    vim.lsp.enable(lsp)
end

return spec
