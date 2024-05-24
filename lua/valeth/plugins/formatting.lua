local autocmd = vim.api.nvim_create_autocmd
local autogroup = vim.api.nvim_create_augroup

local spec = {
    "mhartington/formatter.nvim",
}

spec.config = function()
    local formatter = require("formatter")

    formatter.setup({
        filetype = {
            c = {
                require("formatter.filetypes.c").clangformat
            },
        }
    })
end

local function format_file()
    local bufnr = vim.api.nvim_get_current_buf()
    local lsp_client = vim.lsp.get_clients({ bufnr = bufnr })

    if #lsp_client ~= 0 then
        vim.lsp.buf.format({ async = false, timeout_ms = 5000 })
    else
        vim.cmd(":FormatWrite")
    end
end

vim.keymap.set("n", "<Leader>fmt", format_file)

-- Format on save
autocmd("BufWritePost", {
    group = autogroup("FormatOnSave", {}),
    callback = format_file,
})

return spec
