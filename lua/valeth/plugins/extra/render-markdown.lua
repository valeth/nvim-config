vim.api.nvim_set_hl(0, "RenderMarkdownHdNoBg", { bg = "NONE" })

require("render-markdown").setup({
    heading = {
        -- Disable the background for heading lines
        backgrounds = { "RenderMarkdownHdNoBg" },
        position = "inline",
    },

    -- just extra clutter
    sign = {
        enabled = false
    },
})
