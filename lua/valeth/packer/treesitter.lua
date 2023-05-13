require("nvim-treesitter.configs").setup {
    ensure_installed = { "rust", "lua", "javascript", "typescript" },

    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    endwise = { enable = true }
}

require("treesitter-context").setup()

require("nvim-treesitter.install").update({ with_sync = true })()
