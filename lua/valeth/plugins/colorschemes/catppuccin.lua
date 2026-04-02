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
