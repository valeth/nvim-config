local spec = {
    "jiaoshijie/undotree",
}

spec.keys = {
    "<Leader>u",
}

spec.config = function()
    local undotree = require("undotree")

    vim.keymap.set("n", "<Leader>u", undotree.toggle, { noremap = true, silent = true })

    undotree.setup()
end

return spec
