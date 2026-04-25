local autocmd = vim.api.nvim_create_autocmd
local autogroup = vim.api.nvim_create_augroup

local function toggle_inlay_hints()
    -- the docs suggest this, so this should be fine
    ---@diagnostic disable-next-line: missing-parameter
    local to_enable = not vim.lsp.inlay_hint.is_enabled()
    vim.lsp.inlay_hint.enable(to_enable)
    local status = to_enable and "enabled" or "disabled"
    vim.notify("Inlay hints " .. status, vim.log.levels.INFO)
end

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
        local buf = event.buf
        bufmap(buf, "n", "gd", vim.lsp.buf.definition, "Go to definition")
        bufmap(buf, "n", "gr", vim.lsp.buf.references, "Go to reference")
        bufmap(buf, "n", "K", vim.lsp.buf.hover, "Show documentation in hover")
        bufmap(buf, "n", "<Leader>ca", vim.lsp.buf.code_action, "Run a code action")
        bufmap(buf, "n", "<Leader>ci", vim.diagnostic.open_float, "Show diagnostics")
        bufmap(buf, "n", "<Leader>re", vim.lsp.buf.rename, "Rename item under cursor")
        bufmap(buf, { "n", "i" }, "<C-h>", vim.lsp.buf.signature_help, "Open signature help")
        bufmap(buf, "n", "<Leader>ch", toggle_inlay_hints, "Toggle LSP inlay hints")
    end
})

autocmd("BufEnter", {
    callback = function()
        for entry in vim.fs.dir(vim.fs.joinpath(vim.fn.stdpath("config"), "lsp")) do
            local filename = vim.fs.basename(entry)
            local lsp = filename:match("^(.+)%..+")
            vim.lsp.enable(lsp)
        end
    end
})
