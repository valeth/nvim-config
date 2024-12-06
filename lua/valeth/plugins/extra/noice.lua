return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
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
    },
    keys = {
        { "<leader>nd", "<cmd>NoiceDismiss<CR>", desc = "Dismiss all noice messages" },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    }
}
