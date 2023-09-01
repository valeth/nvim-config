return {
    {
        "CantoroMC/ayu-nvim",
        priority = 1000, -- make sure this is loaded first
        config = function()
            vim.g.ayu_mirage = true
            vim.cmd.colorscheme("ayu")
        end
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            space_char_blankline = " ",
            show_current_context = true,
            show_current_context_start = false,
        }
    },

    "lewis6991/gitsigns.nvim",
}
