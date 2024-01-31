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
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")

    local function get_current_prompt(picker)
        local win = picker.prompt_win
        local bufnr = picker.prompt_bufnr
        local prefix = picker.prompt_prefix
        local lines = vim.api.nvim_win_get_cursor(win)
        local line_start = lines[1] - 1
        local line_end = line_start + 1
        local buf_line = vim.api.nvim_buf_get_lines(bufnr, line_start, line_end, false)[1]
        return buf_line:sub(#prefix + 1)
    end

    local function cycle_picker(bufnr)
        local state = require("telescope.actions.state")
        local current_picker = state.get_current_picker(bufnr)
        local title = current_picker.prompt_title
        local current_prompt = get_current_prompt(current_picker)

        if title == "Buffers" then
            builtin.find_files({ default_text = current_prompt })
        elseif title == "Find Files" then
            builtin.buffers({ default_text = current_prompt })
        end
    end

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
                        ["<C-f>"] = cycle_picker,
                    },
                    n = {
                        ["dd"] = actions.delete_buffer,
                    }
                }
            },
            find_files = {
                mappings = {
                    i = {
                        ["<C-f>"] = cycle_picker,
                    }
                }
            }
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
