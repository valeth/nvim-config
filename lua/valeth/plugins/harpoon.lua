local spec = {
    "ThePrimeagen/harpoon",
}

spec.dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
}

spec.keys = {
    { "<Leader>fh", "<cmd>Telescope harpoon marks<CR>", desc = "Show harpoon marks" },
}

spec.config = function()
    local telescope = require("telescope")

    telescope.load_extension("harpoon")

    local harpoon_mark = require("harpoon.mark")
    local harpoon_ui = require("harpoon.ui")

    vim.keymap.set("n", "<Leader>am", harpoon_mark.add_file, { desc = "Add a file to marks" })
    vim.keymap.set("n", "<Leader>gn", harpoon_ui.nav_next, { desc = "Go to next mark" })
    vim.keymap.set("n", "<Leader>gp", harpoon_ui.nav_prev, { desc = "Go to previous mark" })
end

return spec
