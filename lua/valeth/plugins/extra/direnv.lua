vim.api.nvim_create_autocmd("User", {
    pattern = "DirenvLoaded",
    callback = function()
        vim.cmd(":LspStart")
    end
})

require("direnv").setup({
    autoload_direnv = true,
    statusline = {
        enable = true
    }
})
