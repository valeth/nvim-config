local function install_packer(path)
    vim.fn.system({
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim",
        path
    })

    vim.cmd [[packadd packer.nvim]]
end

local function ensure_packer()
    local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

    if vim.fn.isdirectory(install_path) == 0 then
        install_packer(install_path)
        return true
    end

    return false
end

local packer_bootstrap = ensure_packer()


-- Plugins

local function spec(use)
    use "wbthomason/packer.nvim"

    use {
        "nvim-treesitter/nvim-treesitter",
        requires = {
            { "nvim-treesitter/nvim-treesitter-context" }
        },
        run = function()
            require("valeth.packer.treesitter")
        end
    }


    use "wakatime/vim-wakatime"

    -- Currently doesn't seem to have an option to make it off by default easily
    use {
        "andweeb/presence.nvim",
        config = function()
            require("valeth.packer.presence")
        end
    }

    use {
        "stevearc/resession.nvim",
        config = function()
            require("valeth.packer.session")
        end
    }


    ---- Language Specific Stuff

    use {
        "saecki/crates.nvim",
        tag = "v0.3.0",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "hrsh7th/nvim-cmp" },
        },
        config = function()
            require("valeth.packer.crates")
        end
    }

    use {
        "LhKipp/nvim-nu"
    }


    ---- LSP Stuff

    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            { "neovim/nvim-lspconfig" },
            -- completion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-path" },
            -- formatting
            { "mhartington/formatter.nvim" },
            -- snippets
            { "saadparwaiz1/cmp_luasnip" },
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
            -- lsp manager
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
        },
        config = function()
            require("valeth.packer.lsp")
        end
    }


    ---- Just Visual Stuff

    use {
        "CantoroMC/ayu-nvim",
        config = function()
            vim.g.ayu_mirage = true
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

    use {
        "nvim-lualine/lualine.nvim",
        requires = {
            { "nvim-tree/nvim-web-devicons" },
            { "stevearc/overseer.nvim" },
        },
        config = function()
            require("valeth.packer.lualine")
        end
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup {
                space_char_blankline = " ",
                show_current_context = true,
                show_current_context_start = false,
            }
        end
    }

    use {
        "laytan/cloak.nvim",
        config = function()
            require("cloak").setup({
                cloak_length = 5,
                patterns = {
                    { file_pattern = "*.env*", cloak_pattern = "=.+" }
                }
            })
        end
    }


    ---- Shortcuts

    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    }

    use {
        "windwp/nvim-autopairs",
        config = function()
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp = require("cmp")
            require("nvim-autopairs").setup()
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end
    }

    use {
        "RRethy/nvim-treesitter-endwise",
        requires = {
            { "nvim-treesitter/nvim-treesitter" },
        }
    }

    use {
        "TimUntersberger/neogit",
        requires = {
            { "nvim-lua/plenary.nvim" },
        },
        config = function ()
            require("valeth.packer.neogit")
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
            require("valeth.packer.telescope")
        end
    }

    use {
        "prichrd/netrw.nvim",
        disable = true,
        config = function()
            require("netrw").setup()
        end
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
            require("valeth.packer.undotree")
        end
    }

    use {
        "nvim-tree/nvim-tree.lua",
        requires = {
            { "nvim-tree/nvim-web-devicons" },
        },
        config = function()
            require("valeth.packer.nvim-tree")
        end
    }

    use {
        "stevearc/overseer.nvim",
        config = function()
            require('overseer').setup()
        end
    }

    if packer_bootstrap then
        require("packer").sync()
    end
end


-- Automatically reload packer configuration on write
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer.lua source <afile> | PackerCompile
    augroup end
]])


return require("packer").startup {
    spec,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({
                    border = {
                        { '╭', 'FloatBorder' },
                        { '─', 'FloatBorder' },
                        { '╮', 'FloatBorder' },
                        { '│', 'FloatBorder' },
                        { '╯', 'FloatBorder' },
                        { '─', 'FloatBorder' },
                        { '╰', 'FloatBorder' },
                        { '│', 'FloatBorder' },
                    },
                })
            end
        }
    }
}
