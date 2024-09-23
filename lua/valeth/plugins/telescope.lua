local spec = {
    "nvim-telescope/telescope.nvim",
}

spec.dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
}

spec.keys = {
    { "<Leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find in files" },
    { "<Leader>fb", "<cmd>Telescope buffers<CR>",    desc = "Find in buffers" },
    { "<Leader>fg", "<cmd>Telescope live_grep<CR>",  desc = "Find by grepping" },
    { "<Leader>fc", "<cmd>Telescope git_status<CR>", desc = "Find changed files" },
}

-- Not sure where in the state this is stored, so just track it here
local find_files_show_hidden = false

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

    -- Very primitive solution, but good enough for now
    local function toggle_hidden(bufnr)
        local state = require("telescope.actions.state")
        local current_picker = state.get_current_picker(bufnr)
        local current_prompt = get_current_prompt(current_picker)

        find_files_show_hidden = not find_files_show_hidden

        builtin.find_files({ default_text = current_prompt, hidden = find_files_show_hidden })
    end

    local find_prompt_prefix = "🔍";

    telescope.setup({
        defaults = {
            initial_mode = "insert"
        },
        pickers = {
            buffers = {
                prompt_prefix = find_prompt_prefix,
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
                prompt_prefix = find_prompt_prefix,
                mappings = {
                    i = {
                        ["<C-f>"] = cycle_picker,
                        ["<C-h>"] = toggle_hidden,
                    }
                }
            }
        }
    })
end

return spec
