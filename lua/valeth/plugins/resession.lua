local function started_without_args()
    return vim.fn.argc(-1) == 0
end

local function session_name()
    local working_dir = vim.fn.getcwd()
    local git_branch = vim.fn.systemlist("git branch --show-current")[1]
    if vim.v.shell_error == 0 then
        return working_dir .. "-" .. git_branch .. ".git"
    else
        return working_dir
    end
end

local function load_session()
    if not started_without_args() then
        return
    end

    local ok = pcall(require("resession").load, session_name(), { dir = "dirsession", silence_errors = true })

    if not ok then
        vim.notify("Failed to load session", vim.log.levels.WARN)
    end
end

local function save_session()
    if not started_without_args() then
        return
    end

    local ok = pcall(require("resession").save, session_name(), { dir = "dirsession", notify = false })

    if not ok then
        vim.notify("Failed to save session", vim.log.levels.WARN)
    end
end

local spec = {
    "stevearc/resession.nvim",
}

spec.config = function()
    local resession = require("resession")

    vim.api.nvim_create_autocmd("VimEnter", { callback = load_session, })
    vim.api.nvim_create_autocmd("VimLeavePre", { callback = save_session })

    resession.setup({})
end

return spec
