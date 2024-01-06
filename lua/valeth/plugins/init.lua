vim.diagnostic.config({
    virtual_text = false,
})

return {
    {
        "cameron-wags/rainbow_csv.nvim",
        ft = "csv",
        opts = {},
    },

    {
        "stevearc/dressing.nvim",
        opts = {},
    },

    {
        "stevearc/oil.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = {},
        cmd = { "Oil" },
        keys = {
            { "<Leader>ft", "<cmd>Oil<CR>", mode = "n" }
        },
    },
}
