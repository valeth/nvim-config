require("cloak").setup({
    cloak_length = 5,
    patterns = {
        { file_pattern = "*.env*", cloak_pattern = "=.+" }
    }
})
