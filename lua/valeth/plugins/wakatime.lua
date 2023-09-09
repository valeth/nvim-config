return {
    "wakatime/vim-wakatime",
    event = function()
        if os.getenv("WAKATIME_HOME") then
            return { "VimEnter" }
        else
            return {}
        end
    end
}
