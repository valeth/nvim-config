local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.load_extension("harpoon")

telescope.setup {
    defaults = {
        initial_mode = "normal"
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
vim.keymap.set("n", "<Leader>fgc", telescope_builtin.git_commits)
vim.keymap.set("n", "<Leader>fgs", telescope_builtin.git_status)
vim.keymap.set("n", "<Leader>fgd", telescope_builtin.git_stash)

local telescope_ext = require("telescope").extensions
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

vim.keymap.set("n", "<Leader>fh", telescope_ext.harpoon.marks)
vim.keymap.set("n", "<Leader>am", harpoon_mark.add_file)
vim.keymap.set("n", "<Leader>gn", harpoon_ui.nav_next)
vim.keymap.set("n", "<Leader>gp", harpoon_ui.nav_prev)
