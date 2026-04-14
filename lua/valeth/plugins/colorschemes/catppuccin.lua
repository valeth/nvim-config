require("catppuccin").setup({
    custom_highlights = function(colors)
        return {
            -- Remove background on folded line
            Folded = { bg = colors.none },
            -- Remove blue background from fold ellipsis
            UfoFoldedEllipsis = { fg = colors.blue, bg = colors.none },
        }
    end,
    integrations = {
        noice = true,
        harpoon = true,
        lsp_trouble = true,
        which_key = true,
    }
})

-- Neovim also has a simplified builtin catppuccin colorscheme
vim.cmd.colorscheme("catppuccin-nvim")
