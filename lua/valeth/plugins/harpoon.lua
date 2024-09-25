local spec = {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
}

spec.dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
}

-- TODO: Add keybinds to remove mark from list and reorder them
local function toggle_telescope(harpoon_files)
    local file_paths = {}

    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    local config = require("telescope.config").values
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")

    local picker = pickers.new({}, {
        prompt_title = "Harpoon",
        finder = finders.new_table({
            results = file_paths,
        }),
        previewer = config.file_previewer({}),
        sorter = config.generic_sorter({}),
    })

    picker:find()
end

spec.config = function()
    local harpoon = require("harpoon")
    local keymap = vim.keymap.set

    harpoon:setup()

    keymap("n", "<Leader>hl", function()
        toggle_telescope(harpoon:list())
    end, { desc = "Show harpoon marks" })

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
