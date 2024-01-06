local spec = {
    "luukvbaal/statuscol.nvim",
    lazy = true,
}

spec.dependencies = {
    { "lewis6991/gitsigns.nvim", opts = {}},
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

    local function line_numbers(args, fa)
        if vim.api.nvim_get_mode().mode == "n" then
            return builtin.lnumfunc(args, fa)
        else
            return "%l"
        end
    end

    local signs = {
        text = { "%s" },
    }
    local folds = {
        text = { builtin.foldfunc, " " },
        condition = { builtin.not_empty },
    }
    local numbers = {
        text = { line_numbers, " " },
        condition = { true, builtin.not_empty },
    }

    statuscol.setup({
        relculright = true,
        segments = { signs, folds, numbers }
    })
end

return spec
