local neogit = require("neogit")

local function git_status()
    neogit.open()
end

local function git_commit()
    neogit.open({ "commit" })
end

vim.keymap.set("n", "<Leader>vs", git_status)
vim.keymap.set("n", "<Leader>vc", git_commit)

neogit.setup()
