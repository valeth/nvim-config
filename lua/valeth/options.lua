local augroup = vim.api.nvim_create_augroup
local aucmd = vim.api.nvim_create_autocmd

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.winborder = "rounded"

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8

vim.opt.colorcolumn = "100"

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

vim.opt.fillchars:append({ eob = "·" })

vim.g.mapleader = " "

vim.diagnostic.config({
    virtual_text = false,
})

augroup("valeth", { clear = true })

-- Temporarily highlight yanked text
aucmd("TextYankPost", {
    group = "valeth",
    callback = function()
        vim.highlight.on_yank({ timeout = 500 })
    end
})

-- Hide cursor line while in insert mode
aucmd({ "InsertEnter", "InsertLeave", "BufEnter" }, {
    group = "valeth",
    callback = function(args)
        local entered_insert_mode = args.event == "InsertEnter"
        vim.opt.cursorline = not entered_insert_mode
    end
})

-- Open help window in a vertical split
aucmd("BufWinEnter", {
    group = "valeth",
    pattern = "*/doc/*",
    callback = function()
        if vim.bo.filetype == "help" then
            vim.cmd.wincmd("H")
        end
    end
})
