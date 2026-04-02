return {
    "laytan/cloak.nvim",
    opts = {
        cloak_length = 5,
        patterns = {
            { file_pattern = "*.env*", cloak_pattern = "=.+" }
        }
    }
}
