local undotree = require("undotree")

vim.keymap.set("n", "<Leader>u", undotree.toggle, { noremap = true, silent = true })

undotree.setup()
