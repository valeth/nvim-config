local ayu_spec = {
    "valeth/ayu-nvim",
    branch = "fold-column-fg",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.ayu_mirage = true
        vim.cmd.colorscheme("ayu")
    end
}

local catppuccin_spec = {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            custom_highlights = function(colors)
                return {
                    Folded = { bg = colors.none },
                    UfoFoldedEllipsis = { fg = colors.blue, bg = colors.none },
                }
            end,
            integrations = {
                mason = true,
                noice = true,
                harpoon = true,
                lsp_trouble = true,
                which_key = true,
            }
        })

        vim.cmd.colorscheme("catppuccin")
    end
}

return {
    ayu_spec, catppuccin_spec
}
