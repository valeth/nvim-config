vim.pack.add({
    -- Core
    "https://github.com/valeth/nvim-treesitter",
    "https://github.com/valeth/nvim-treesitter-textobjects",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/hrsh7th/nvim-cmp",
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    "https://github.com/hrsh7th/cmp-path",
    "https://github.com/onsails/lspkind.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/NeogitOrg/neogit",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/stevearc/resession.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
    -- Colorschemes
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
    -- Extra
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/MunifTanjim/nui.nvim",
    "https://github.com/echasnovski/mini.icons",
    "https://github.com/kevinhwang91/promise-async",
    "https://github.com/folke/flash.nvim",
    "https://github.com/folke/noice.nvim",
    "https://github.com/folke/trouble.nvim",
    "https://github.com/folke/which-key.nvim",
    "https://github.com/stevearc/dressing.nvim",
    "https://github.com/mhartington/formatter.nvim",
    "https://github.com/NotAShelf/direnv.nvim",
    "https://github.com/lukas-reineke/indent-blankline.nvim",
    "https://github.com/saecki/crates.nvim",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/rcarriga/nvim-notify",
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    "https://github.com/luukvbaal/statuscol.nvim",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/laytan/cloak.nvim",
    { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
    "https://github.com/kevinhwang91/nvim-ufo",
})


require("valeth.plugins.core")
require("valeth.plugins.colorschemes")
require("valeth.plugins.extra")
