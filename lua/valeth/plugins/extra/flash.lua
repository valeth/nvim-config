return {
    "folke/flash.nvim",
    opts = {},
    keys = {
        { "<Leader>j", mode = { "n" }, function() require("flash").jump() end,       desc = "Jump to location" },
        { "<Leader>s", mode = { "n" }, function() require("flash").treesitter() end, desc = "Select area" },
    },
}
