require("nvim-treesitter.configs").setup {
    ensure_installed = { "rust", "lua", "javascript" },

    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

require("treesitter-context").setup()
