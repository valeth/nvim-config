local spec = {
    "folke/noice.nvim",
}

spec.event = "VeryLazy"

spec.opts = {
    notify = {
        -- keep this disabled until I find a solution to make it less obnoxious
        enabled = false
    },
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
    presets = {
        command_palette = true,
        lsp_doc_border = true,
    },
    messages = {
        view = "mini",
    },
    views = {
        notify = {
            replace = true,
        },
    },
}

spec.keys = {
    { "<leader>nd", "<cmd>NoiceDismiss<CR>", desc = "Dismiss all noice messages" },
}

spec.dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
}

return spec
