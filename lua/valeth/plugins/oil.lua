local function get_directory_name(buf, line)
    local oil = require("oil")

    local entry = oil.get_entry_on_line(buf, line)
    if entry == nil then
        return
    end

    if entry.type == "directory" then
        return entry.name .. "/"
    else
        local dirname = entry.name:match("^(.*/).*$")
        if dirname == nil then
            return
        end

        return dirname
    end
end


local function insert_directory(direction)
    local cur_buf = vim.api.nvim_get_current_buf()
    local cur_win = vim.api.nvim_get_current_win()
    local cursor = vim.api.nvim_win_get_cursor(cur_win)

    local dir = get_directory_name(cur_buf, cursor[1])

    if dir == nil then
        return
    end

    if direction == "below" then
        local line = cursor[1]
        vim.api.nvim_buf_set_lines(cur_buf, line, line, false, { dir })
        vim.api.nvim_win_set_cursor(cur_win, { line + 1, cursor[2] })
    else
        local line = cursor[1] - 1
        vim.api.nvim_buf_set_lines(cur_buf, line, line, false, { dir })
        vim.api.nvim_win_set_cursor(cur_win, { cursor[1], cursor[2] })
    end
end


local spec = {
    "stevearc/oil.nvim",
}

spec.dependencies = {
    "nvim-lua/plenary.nvim"
}

spec.opts = {
    view_options = {
        show_hidden = true,
    },
    columns = { "icon", "permissions" },
    keymaps = {
        ["J"] = function()
            insert_directory("below")
        end,
        ["K"] = function()
            insert_directory("above")
        end,
    }
}

spec.cmd = { "Oil" }

spec.keys = {
    { "<Leader>ft", "<cmd>Oil<CR>", mode = "n" }
}

return spec
