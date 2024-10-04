local spec = {
    "nvim-treesitter/nvim-treesitter",
}


spec.dependencies = {
    "nvim-treesitter/nvim-treesitter-context",
    "RRethy/nvim-treesitter-endwise",
}


spec.build = ":TSUpdate"


spec.config = function()
    ---@diagnostic disable-next-line:missing-fields
    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "rust",
            "lua",
            "javascript",
            "typescript",
            "regex",
            "markdown",
            "markdown_inline"
        },

        sync_install = false,

        auto_install = true,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },

        endwise = { enable = true }
    })

    require("treesitter-context").setup()
end

return spec
