return {
    "wakatime/vim-wakatime",
    cond = function()
        return not (os.getenv("WAKATIME_HOME") == nil)
    end
}
