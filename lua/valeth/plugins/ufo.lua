local spec = {
    "kevinhwang91/nvim-ufo",
}

spec.dependencies = {
    "kevinhwang91/promise-async",
    "luukvbaal/statuscol.nvim",
}

spec.event = "LspAttach"

spec.config = function()
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
        close_fold_kinds = {"comment", "imports"},
    })
end

return spec
