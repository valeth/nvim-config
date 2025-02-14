local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    local output = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })

    if vim.v.shell_error ~= 0 then
        vim.notify("Failed to clone lazy.nvim", vim.log.levels.ERROR)
        vim.notify(output, vim.log.levels.ERROR)
        vim.fn.getchar()
        os.exit(1)
    end

    vim.notify("Installed lazy.nvim")
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    ui = {
        border = "rounded",
    },
    spec = {
        { import = "valeth.plugins.colorschemes" },
        { import = "valeth.plugins.core" },
        { import = "valeth.plugins.extra" },
    }
})
