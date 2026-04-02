local spec = {
    "nvim-treesitter/nvim-treesitter",
}


spec.dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
}


spec.build = ":TSUpdate"


spec.config = function()
    ---@diagnostic disable-next-line:missing-fields
    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            -- programming languages
            "rust",
            "lua",
            "ruby",
            "python",
            "elixir",
            "javascript",
            "typescript",
            -- markup and config languages
            "html",
            "css",
            "json",
            "yaml",
            "toml",
            "regex",
            "markdown",
            "markdown_inline",
            -- shell scripting and system configuration
            "bash",
            "nu",
            "nix",
        },

        sync_install = false,

        auto_install = true,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },

        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["am"] = { query = "@function.outer", desc = "Select outer function" },
                    ["im"] = { query = "@function.inner", desc = "Select inner function" },
                    ["ab"] = { query = "@block.outer", desc = "Select outer block" },
                    ["ib"] = { query = "@block.inner", desc = "Select inner block" },
                },
            },

            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    ["]m"] = { query = "@function.outer", desc = "Go to start of next function" },
                    ["]b"] = { query = "@block.outer", desc = "Go to start of next block" },
                    ["]s"] = { query = "@class.outer", desc = "Go to start of next struct-like" },
                },
                goto_next_end = {
                    ["]M"] = { query = "@function.outer", desc = "Go to end of next function" },
                    ["]B"] = { query = "@block.outer", desc = "Go to end of next block" },
                    ["]S"] = { query = "@class.outer", desc = "Go to end of next struct-like" },
                },
                goto_previous_start = {
                    ["[m"] = { query = "@function.outer", desc = "Go to start of previous function" },
                    ["[b"] = { query = "@block.outer", desc = "Go to start of previous block" },
                    ["[s"] = { query = "@class.outer", desc = "Go to start of previous struct-like" },
                },
                goto_previous_end = {
                    ["[M"] = { query = "@function.outer", desc = "Go to end of previous function" },
                    ["[B"] = { query = "@block.outer", desc = "Go to end of previous block" },
                    ["[S"] = { query = "@class.outer", desc = "Go to end of previous struct-like" },
                },
            },
        },
    })
end

return spec
