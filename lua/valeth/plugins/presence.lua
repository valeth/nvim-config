local create_autocmd = vim.api.nvim_create_autocmd
local create_autogroup = vim.api.nvim_create_augroup
local create_usercmd = vim.api.nvim_create_user_command

local presence_enabled = false

local function enabled_for_project()
    local neoconf = require("neoconf")
    return neoconf.get("presence") or false
end

local function enable()
    local presence = require("presence")
    presence_enabled = true
    presence:handle_win_enter()
end

local function disable()
    local presence = require("presence")
    presence_enabled = false
    presence:cancel()
end

local function toggle()
    if presence_enabled then
        disable()
    else
        enable()
    end
end


local spec = {
    "andweeb/presence.nvim",
}

spec.dependencies = {
    "folke/neoconf.nvim",
}

spec.config = function()
    local presence = require("presence")

    local presence_group = create_autogroup("PresenceEvents", { clear = true })
    local presence_autocmds = {
        ["FocusGained"] = "handle_focus_gained",
        ["TextChanged"] = "handle_text_changed",
        ["VimLeavePre"] = "handle_vim_leave_pre",
        ["WinEnter"] = "handle_win_enter",
        ["WinLeave"] = "handle_win_leave",
        ["BufEnter"] = "handle_buf_enter",
        ["BufAdd"] = "handle_buf_add",
    }

    for event, callback_fn in pairs(presence_autocmds) do
        create_autocmd(event, {
            group = presence_group,
            callback = function()
                if presence_enabled then
                    presence[callback_fn](presence)
                end
            end
        })
    end

    create_autocmd({"VimEnter", "BufEnter"}, {
        group = presence_group,
        callback = function()
            if enabled_for_project() then
                enable()
            else
                disable()
            end
        end
    })

    create_usercmd("PresenceToggle", toggle, { nargs = 0 })

    create_usercmd("PresenceState",
        function()
            print(presence_enabled and "enabled" or "disabled")
        end,
        { nargs = 0 }
    )

    presence.setup({
        auto_update = false,
        show_time = false,
    })
end

return spec
