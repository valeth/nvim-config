local ufo = require("ufo")
local autocmd = vim.api.nvim_create_autocmd
local autogroup = vim.api.nvim_create_augroup

vim.opt.foldenable = true

autocmd("LspAttach", {
    group = autogroup("LspUfo", {}),
    callback = function(event)
        ufo.attach(event.buf)
    end
})

ufo.setup({
    close_fold_kinds_for_ft = {
        default = { "comment", "imports" },
    },
})

vim.keymap.set("n", "<leader>z", function()
    require("ufo").peekFoldedLinesUnderCursor()
end)
