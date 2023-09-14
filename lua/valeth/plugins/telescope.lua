local spec = {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
}

spec.dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ThePrimeagen/harpoon",
}

spec.keys = {
    "<Leader>ff",
    "<Leader>fb",
    "<Leader>fg",
    "<Leader>fh",
}

spec.config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.load_extension("harpoon")

    telescope.setup {
        defaults = {
            initial_mode = "insert"
        },
        pickers = {
            buffers = {
                mappings = {
                    i = {
                        ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
                    },
                    n = {
                        ["dd"] = actions.delete_buffer,
                    }
                }
            },
        }
    }

    local telescope_builtin = require("telescope.builtin")

    vim.keymap.set("n", "<Leader>ff", telescope_builtin.find_files)
    vim.keymap.set("n", "<Leader>fb", telescope_builtin.buffers)
    vim.keymap.set("n", "<Leader>fg", telescope_builtin.live_grep)

    local telescope_ext = require("telescope").extensions
    local harpoon_mark = require("harpoon.mark")
    local harpoon_ui = require("harpoon.ui")

    vim.keymap.set("n", "<Leader>fh", telescope_ext.harpoon.marks)
    vim.keymap.set("n", "<Leader>am", harpoon_mark.add_file)
    vim.keymap.set("n", "<Leader>gn", harpoon_ui.nav_next)
    vim.keymap.set("n", "<Leader>gp", harpoon_ui.nav_prev)
end

return spec
