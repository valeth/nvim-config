local spec = {
    "wakatime/vim-wakatime",
}

spec.event = function()
    local wakatime_home = os.getenv("WAKATIME_HOME")

    if wakatime_home and vim.loop.fs_stat(wakatime_home) then
        return { "VimEnter" }
    end

    return {}
end

return spec
