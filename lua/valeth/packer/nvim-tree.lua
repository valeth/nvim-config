local nvim_tree = require("nvim-tree")
local nvim_tree_api = require("nvim-tree.api")

vim.keymap.set("n", "<Leader>ft", nvim_tree_api.tree.open)

nvim_tree.setup({
    view = {
        float = {
            enable = true
        }
    }
})
