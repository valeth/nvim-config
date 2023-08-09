local lsp = require("lsp-zero")
local ufo = require("ufo")

lsp.preset("recommended")

lsp.ensure_installed {
    "rust_analyzer"
}

lsp.nvim_workspace()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mapping = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

-- Hitting tab should indent, not complete
cmp_mapping["<Tab>"] = nil
cmp_mapping["<S-Tab>"] = nil

lsp.setup_nvim_cmp({ mapping = cmp_mapping })

vim.diagnostic.config({
    virtual_text = false,
})

vim.keymap.set("n", "<Leader>ci", vim.diagnostic.open_float, { desc = "Display diagnostic Code Info" })

-- Gimme pretty icons
lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

lsp.on_attach(function(_, buffnr)
    local opts = { buffer = buffnr, remap = false }

    ufo.attach(buffnr)

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<Leader>re", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "i" }, "<C-h>", vim.lsp.buf.signature_help, opts)

    vim.keymap.set("n", "<Leader>fmt", function()
        vim.lsp.buf.format({ async = false, timeout_ms = 5000 })
    end)
end)


-- NOTE: Format on save does not support async formatting
lsp.format_on_save({
    servers = {
        ["rust_analyzer"] = { "rust" }
    }
})

lsp.configure("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {
            rustfmt = {
                extraArgs = { "+nightly" }
            }
        }
    }
})

vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

ufo.setup {
    close_fold_kinds = {"comment", "imports"},
}

lsp.setup()
