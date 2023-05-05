return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })()
        end
    }

    use "nvim-treesitter/nvim-treesitter-context"

    use "wakatime/vim-wakatime"


    ---- LSP Stuff

    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            { "neovim/nvim-lspconfig" },
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
        }
    }

    use "mhartington/formatter.nvim"


    ---- Just Visual Stuff

    use {
        "CantoroMC/ayu-nvim",
        config = function()
            vim.cmd.colorscheme("ayu")
        end
    }

    use "nvim-tree/nvim-web-devicons"

    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    }


    ---- Shortcuts

    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    }


    ---- Navigation

    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" },
        },
        config = function()
            require("telescope").load_extension("harpoon")
        end
    }

    use {
        "prichrd/netrw.nvim",
        config = function()
            require("netrw").setup()
        end
    }

    use {
        "valeth/remote-sshfs.nvim",
        branch = "no-cwd-on-jobstart",
        requires = {
            { "nvim-telescope/telescope.nvim" },
        }
    }

    use {
        "ThePrimeagen/harpoon",
        requires = {
            { "nvim-lua/plenary.nvim" },
        }
    }

    use {
        "jiaoshijie/undotree",
        requires = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("undotree").setup()
        end
    }
end)
