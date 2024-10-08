local spec = {
    "luukvbaal/statuscol.nvim",
    lazy = true,
}

spec.dependencies = {
    { "lewis6991/gitsigns.nvim", opts = {} },
}

spec.config = function()
    local statuscol = require("statuscol")
    local builtin = require("statuscol.builtin")

    -- Give me fancy diagnostic signs
    for level, text in pairs({ Error = "✘", Warn = "▲", Info = "»", Hint = "⚑" }) do
        local name = "DiagnosticSign" .. level
        vim.fn.sign_define(name, { text = text, texthl = name })
    end

    vim.opt.signcolumn = "yes"
    vim.opt.foldcolumn = "1"

    -- This seems to work just fine
    ---@diagnostic disable-next-line:param-type-mismatch
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
