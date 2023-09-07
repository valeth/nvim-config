local spec = {
    "nvim-tree/nvim-tree.lua",
}

spec.dependencies = {
    "nvim-tree/nvim-web-devicons"
}

spec.keys = {
    { "<Leader>ft", "<cmd>NvimTreeToggle<CR>", mode = "n" },
}

spec.config = function()
    local nvim_tree = require("nvim-tree")
    local nvim_tree_api = require("nvim-tree.api")


    local function kmap_opts(bufnr, desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true
        }
    end

    local function on_attach(bufnr)
        nvim_tree_api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set("n", "<ESC>", nvim_tree_api.tree.close, kmap_opts(bufnr, "Close"))
    end

    nvim_tree.setup({
        view = {
            float = {
                enable = true
            }
        },
        on_attach = on_attach,
    })
end

return spec
