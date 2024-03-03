local spec = {
    "folke/which-key.nvim"
}

spec.init = function()
    vim.opt.timeout = true
    -- the keybinds help is shown after this timeout
    vim.opt.timeoutlen = 500
end

spec.opts = {
    show_help = false
}

return spec
