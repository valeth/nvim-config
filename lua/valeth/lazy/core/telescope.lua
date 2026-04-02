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
