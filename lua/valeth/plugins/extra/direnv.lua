return {
    "NotAShelf/direnv.nvim",
    config = function()
        local direnv = require("direnv")

        vim.api.nvim_create_autocmd("User", {
            pattern = "DirenvLoaded",
            callback = function()
                vim.cmd(":LspStart")
            end
        })

        direnv.setup({
            autoload_direnv = true,
            statusline = {
                enable = true
            }
        })
    end
}
