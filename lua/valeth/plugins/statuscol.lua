local spec = {
    "luukvbaal/statuscol.nvim",
    lazy = true,
}

spec.config = function()
    local statuscol = require("statuscol")
    local builtin = require("statuscol.builtin")

    vim.opt.signcolumn = "yes"
    vim.opt.foldcolumn = "1"
    vim.opt.fillchars:append({
        fold = " ",
        foldopen = "",
        foldsep = " ",
        foldclose = "",
    })

    statuscol.setup({
        relculright = true,
        segments = {
            { text = { "%s" }},
            {
                text = { builtin.lnumfunc, " " },
                condition = { true, builtin.not_empty },
            },
            { text = { builtin.foldfunc, " " }},
        }
    })
end

return spec
