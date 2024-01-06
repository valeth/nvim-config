local spec = {
    "nvim-lualine/lualine.nvim",
}

spec.dependencies = {
    "nvim-tree/nvim-web-devicons",
}

spec.config = function()
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
                "encoding",
                { "fileformat", icons_enabled = false },
                "filetype"
            }
        },
    })
end

return spec
