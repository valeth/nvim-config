return {
    {
        "valeth/ayu-nvim",
        branch = "fold-column-fg",
        enabled = false,
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.ayu_mirage = true
            vim.cmd.colorscheme("ayu")
        end
    },

    {
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
                    notify = true,
                }
            })

            vim.cmd.colorscheme("catppuccin")
        end
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        tag = "v3.2.7",
        opts = {
            scope = {
                show_start = false,
            }
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        }
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },

    {
        "rcarriga/nvim-notify",
        config = function()
            local notify = require("notify")

            notify.setup({
                top_down = false,
            })

            vim.notify = notify
        end
    },
}
