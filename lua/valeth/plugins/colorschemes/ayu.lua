local spec = {
    "valeth/ayu-nvim",
    branch = "fold-column-fg",
    enabled = false,
    lazy = false,
    priority = 1000,
}


spec.config = function()
    vim.g.ayu_mirage = true
    vim.cmd.colorscheme("ayu")
end


return spec
