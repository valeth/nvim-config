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

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local started_without_args = vim.fn.argc(-1) == 0

        if started_without_args then
            resession.load(session_name(), { dir = "dirsession", silence_errors = true })
        end
    end
})

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        resession.save(session_name(), { dir = "dirsession", notify = false })
    end
})

resession.setup()
