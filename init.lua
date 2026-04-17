require("valeth.options")
require("valeth.keymaps")
require("valeth.neovide")
require("valeth.treesitter")

if vim.version.ge(vim.version(), "0.12") then
    -- require("vim._core.ui2").enable({})
    require("valeth.plugins")
else
    vim.notify("Plugins require Neovim version 0.12 or higher")
end
