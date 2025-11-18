return {
    "folke/flash.nvim",
    opts = {},
    keys = {
        { "s", mode = { "n" }, function() require("flash").jump() end,       desc = "Jump to location" },
        { "S", mode = { "n" }, function() require("flash").treesitter() end, desc = "Select area" },
    },
}
