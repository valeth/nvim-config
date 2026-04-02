local te_builtin = require("telescope.builtin")
local te_actions = require("telescope.actions")

-- Not sure where in the state this is stored, so just track it here
local find_files_show_hidden = false

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
        te_builtin.find_files({ default_text = current_prompt })
    elseif title == "Find Files" then
        te_builtin.buffers({ default_text = current_prompt })
    end
end

-- Very primitive solution, but good enough for now
local function toggle_hidden(bufnr)
    local state = require("telescope.actions.state")
    local current_picker = state.get_current_picker(bufnr)
    local current_prompt = get_current_prompt(current_picker)

    find_files_show_hidden = not find_files_show_hidden

    te_builtin.find_files({ default_text = current_prompt, hidden = find_files_show_hidden })
end

local find_prompt_prefix = "🔍";

require("telescope").setup({
    defaults = {
        initial_mode = "insert"
    },
    pickers = {
        buffers = {
            prompt_prefix = find_prompt_prefix,
            mappings = {
                i = {
                    ["<C-d>"] = te_actions.delete_buffer + te_actions.move_to_top,
                    ["<C-f>"] = cycle_picker,
                },
                n = {
                    ["dd"] = te_actions.delete_buffer,
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


vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find in files" })
vim.keymap.set("n", "<Leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find in buffers" })
vim.keymap.set("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Find by grepping" })
vim.keymap.set("n", "<Leader>fc", "<cmd>Telescope git_status<CR>", { desc = "Find changed files" })
