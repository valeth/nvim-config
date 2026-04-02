require("valeth.options")
require("valeth.keymaps")
require("valeth.neovide")

if vim.version().minor < 12 then
    if vim.version().minor >= 10 then
        require("valeth.lazy")
    end
else
    require("valeth.plugins")
end
