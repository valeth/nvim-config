local spec = {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
}

spec.dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
}

--- @param harpoon Harpoon
local function toggle_telescope(harpoon)
    local file_paths = {}

    for idx, item in pairs(harpoon:list().items) do
        table.insert(file_paths, { idx, item.value })
    end

    local config = require("telescope.config").values
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local action_state = require("telescope.actions.state")

    local function mappings(prompt_bufnr, map)
        map("i", "<C-d>", function()
            local cur_picker = action_state.get_current_picker(prompt_bufnr)
            local sel_entry = action_state.get_selected_entry().value[2]
            local sel_item = harpoon:list():get_by_value(sel_entry)

            if sel_item == nil then
                return
            end

            cur_picker:delete_selection(function(sel)
                harpoon:list():remove(sel_item)
            end)
        end)

        return true
    end

    local finder = finders.new_table({
        results = file_paths,
        entry_maker = function(entry)
            return {
                value = entry,
                display = entry[1] .. ": " .. entry[2],
                ordinal = entry[2],
                path = entry[2],
            }
        end
    })

    local picker = pickers.new({}, {
        prompt_title = "Harpoon",
        finder = finder,
        previewer = config.file_previewer({}),
        sorter = config.generic_sorter({}),
        attach_mappings = mappings,
    })

    picker:find()
end

spec.config = function()
    local harpoon = require("harpoon")
    local keymap = vim.keymap.set

    harpoon:setup()

    keymap("n", "<Leader>fm", function()
        toggle_telescope(harpoon)
    end, { desc = "Show list of harpoon marks" })

    keymap("n", "<Leader>ha", function()
        harpoon:list():add()
    end, { desc = "Add current file to marks" })

    keymap("n", "<Leader>hr", function()
        harpoon:list():remove()
    end, { desc = "Remove current file from marks" })

    keymap("n", "<Leader>hn", function()
        harpoon:list():next()
    end, { desc = "Go to next mark" })

    keymap("n", "<Leader>hp", function()
        harpoon:list():prev()
    end, { desc = "Go to previous mark" })

    for i = 1, 5 do
        keymap("n", "<Leader>h" .. i, function()
            harpoon:list():select(i)
        end, { desc = "Go to marked file " .. i })
    end
end

return spec
