local autocmd = vim.api.nvim_create_autocmd
local autogroup = vim.api.nvim_create_augroup

local format_on_save = false

local function format_file()
    if not format_on_save then
        return
    end

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
end

-- Format on save
autocmd("BufWritePre", {
    group = autogroup("FormatOnSave", {}),
    callback = format_file,
})


require("formatter").setup({
    filetype = {
        c = {
            require("formatter.filetypes.c").clangformat
        },
    }
})


vim.keymap.set("n", "<Leader>fmt", format_file, { desc = "Format the current buffer" })
vim.keymap.set("n", "<Leader>fos", toggle_format_on_save, { desc = "Toggle format on save" })
