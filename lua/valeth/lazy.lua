local uv = vim.loop


local function locked_commit()
    local lockfile_path = vim.fn.stdpath("config") .. "/lazy-lock.json"
    local lockfile = io.open(lockfile_path, "r")

    if not lockfile then
        return nil
    end

    local text = lockfile:read("*all")
    lockfile:close()
    local json = vim.json.decode(text)

    return json["lazy.nvim"]["commit"]
end


local function checkout_commit(path)
    local commit = locked_commit()

    if not commit then
        return
    end

    uv.spawn("git", {
        args = { "checkout", commit },
        cwd = path
    })
end


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })

    checkout_commit(lazypath)
    vim.wait(1)
    vim.notify("Installed lazy.nvim")
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    ui = {
        border = "rounded",
    },
    spec = {
        { import = "valeth.plugins" },
        { import = "valeth.plugins.lsp" },
    }
})
