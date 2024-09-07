local spec = {
    "MeanderingProgrammer/render-markdown.nvim",
}

spec.dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.icons"
}

spec.config = function()
    local render_md = require("render-markdown")

    vim.api.nvim_set_hl(0, "RenderMarkdownHdNoBg", { bg = "NONE" })

    render_md.setup({
        heading = {
            -- Disable the background for heading lines
            backgrounds = { "RenderMarkdownHdNoBg" }
        },

        -- just extra clutter
        sign = {
            enabled = false
        },
    })
end

return spec
