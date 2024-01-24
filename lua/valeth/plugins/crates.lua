local spec = {
    "saecki/crates.nvim",
    tag = "v0.4.0",
}

spec.dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
}

spec.config = function()
    require("crates").setup()

    local cmp = require("cmp")

    vim.api.nvim_create_autocmd("BufRead", {
        group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
        pattern = "Cargo.toml",
        callback = function()
            cmp.setup.buffer({ sources = { { name = "crates" } } })
        end,
    })
end

return spec
