require("valeth.options")
require("valeth.keymaps")
require("valeth.neovide")

if vim.version().minor >= 10 then
    require("valeth.lazy")
end
