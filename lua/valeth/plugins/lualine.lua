local spec = {
    "nvim-lualine/lualine.nvim",
}

spec.dependencies = {
    "nvim-tree/nvim-web-devicons",
    "stevearc/overseer.nvim",
}

spec.config = function()
    local overseer = require("overseer")

    local task_status = {
        "overseer",
        colored = true,
        symbols = {
            [overseer.STATUS.FAILURE] = "✗ ",
            [overseer.STATUS.CANCELED] = "o ",
            [overseer.STATUS.SUCCESS] = "✓ ",
            [overseer.STATUS.RUNNING] = "⟳ ",
        },
    }

    require("lualine").setup({
        sections = {
            lualine_b = {
                "branch",
                "diff",
                {
                    "diagnostics",
                    symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" }
                },
            },
            lualine_x = {
                task_status,
                "encoding",
                { "fileformat", icons_enabled = false },
                "filetype"
            }
        },
    })
end

return spec
