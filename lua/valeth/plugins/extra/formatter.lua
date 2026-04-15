local autocmd = vim.api.nvim_create_autocmd
local autogroup = vim.api.nvim_create_augroup

local format_on_save = false

local function format_file()
    local bufnr = vim.api.nvim_get_current_buf()
    local lsp_client = vim.lsp.get_clients({ bufnr = bufnr })

    if #lsp_client ~= 0 then
        vim.lsp.buf.format({ async = true, timeout_ms = 5000 })
    else
        vim.cmd(":FormatWrite")
    end
end

local function toggle_format_on_save()
    format_on_save = not format_on_save
    local status = format_on_save and "enabled" or "disabled"
    vim.notify("Format on save " .. status, vim.log.levels.INFO)
end

-- Format on save
autocmd("BufWritePre", {
    group = autogroup("FormatOnSave", {}),
    callback = function()
        if format_on_save then
            format_file()
        end
    end
})


require("formatter").setup({
    filetype = {
        c = {
            require("formatter.filetypes.c").clangformat
        },
    }
})


vim.keymap.set("n", "<Leader>fm", format_file, { desc = "Format the current buffer" })
vim.keymap.set("n", "<Leader>fs", toggle_format_on_save, { desc = "Toggle format on save" })
