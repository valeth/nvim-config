local spec = {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    }
}


local function macro_recording()
    local reg = vim.fn.reg_recording()

    if reg == "" then
        return ""
    end

    return "REC @ " .. reg
end


spec.config = function()
    require("lualine").setup({
        sections = {
            lualine_a = {
                macro_recording,
                "mode",
            },
            lualine_b = {
                "branch",
                "diff",
                {
                    "diagnostics",
                    symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" }
                },
            },
            lualine_x = {
                "lsp_status",
                "encoding",
                { "fileformat", icons_enabled = false },
                "filetype"
            }
        },
    })
end


return spec
