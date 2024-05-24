local spec = {
    "nvim-treesitter/nvim-treesitter",
}

spec.dependencies = {
    "nvim-treesitter/nvim-treesitter-context",
    "RRethy/nvim-treesitter-endwise",
}

spec.config = function()
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

        auto_install = true,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },

        endwise = { enable = true }
    })

    require("treesitter-context").setup()

    require("nvim-treesitter.install").update({ with_sync = true })()
end

return spec
