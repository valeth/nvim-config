require("valeth.options")
require("valeth.keymaps")
require("valeth.neovide")

if vim.version().minor >= 12 then
    require("valeth.plugins")
else
    vim.notify("Plugins require Neovim version 0.12 or higher")
end
