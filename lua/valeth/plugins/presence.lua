local spec = {
    "andweeb/presence.nvim",
}

spec.config = function()
    local presence = require("presence")
    local presence_disabled = true

    local presence_augroup = vim.api.nvim_create_augroup("PresenceEvents", { clear = true })
    local presence_autocmds = {
        { "FocusGained", "handle_focus_gained" },
        { "TextChanged", "handle_text_changed" },
        { "VimLeavePre", "handle_vim_leave_pre" },
        { "WinEnter", "handle_win_enter" },
        { "WinLeave", "handle_win_leave" },
        { "BufEnter", "handle_buf_enter" },
        { "BufAdd", "handle_buf_add" },
    }
    for _, item in ipairs(presence_autocmds) do
        local event = item[1]
        local callback_fn = item[2]
        vim.api.nvim_create_autocmd(event, {
            group = presence_augroup,
            callback = function()
                if not presence_disabled then
                    presence[callback_fn](presence)
                end
            end
        })
    end

    vim.api.nvim_create_user_command("DiscordToggle",
        function()
            if presence_disabled then
                presence_disabled = false
                presence:handle_win_enter()
            else
                presence_disabled = true
                presence:cancel()
            end
        end,
        { nargs = 0 }
    )

    presence.setup({
        auto_update = false,
        show_time = false,
    })
end

return spec
