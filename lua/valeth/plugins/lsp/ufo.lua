local spec = {
    "kevinhwang91/nvim-ufo",
    event = "LspAttach",
}

spec.dependencies = {
    "kevinhwang91/promise-async",
}

spec.config = function()
    local ufo = require("ufo")
    local autocmd = vim.api.nvim_create_autocmd
    local autogroup = vim.api.nvim_create_augroup

    autocmd("LspAttach", {
        group = autogroup("LspUfo", {}),
        callback = function(event)
            ufo.attach(event.buf)
        end
    })

    ufo.setup {
        close_fold_kinds = {"comment", "imports"},
    }
end

return spec
