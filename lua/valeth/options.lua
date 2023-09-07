vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8

vim.opt.colorcolumn = "100"

vim.opt.fillchars:append({ eob = "·" })

vim.api.nvim_create_autocmd({"InsertEnter", "InsertLeave", "BufEnter"}, {
    callback = function(args)
        local entered_insert_mode = args.event == "InsertEnter"
        vim.opt.cursorline = not entered_insert_mode
    end
})

-- yank to clipboard, requires wl-copy command or equivalent
vim.opt.clipboard:append("unnamedplus")

vim.g.mapleader = " "
