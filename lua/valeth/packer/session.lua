local resession = require("resession")

local function session_name()
    local working_dir = vim.fn.getcwd()
    local git_branch = vim.fn.system("git branch --show-current")
    if vim.v.shell_error == 0 then
        return working_dir .. git_branch
    else
        return working_dir
    end
end

local function started_without_args()
    return vim.fn.argc(-1) == 0
end

-- Only restore and save session if NeoVim was started without any arguments
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if started_without_args() then
            resession.load(session_name(), { dir = "dirsession", silence_errors = true })
        end
    end
})

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        if started_without_args() then
            resession.save(session_name(), { dir = "dirsession", notify = false })
        end
    end
})

resession.setup()
