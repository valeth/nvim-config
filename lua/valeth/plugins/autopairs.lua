local spec = {
    "windwp/nvim-autopairs",
}

spec.config = function()
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")

    require("nvim-autopairs").setup()

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return spec
