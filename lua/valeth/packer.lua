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

    if not vim.fn.isdirectory(install_path) then
        install_packer(install_path)
        return true
    end

    return false
end

local packer_bootstrap = ensure_packer()


-- Plugins

local function spec(use)
    use "wbthomason/packer.nvim"

    if packer_bootstrap then
        require("packer").sync()
    end

    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })()
        end
    }

    use "nvim-treesitter/nvim-treesitter-context"

    use "wakatime/vim-wakatime"

    -- Currently doesn't seem to have an option to make it off by default easily
    use {
        "andweeb/presence.nvim",
        disable = true,
        config = function()
            local presence = require("presence")

            presence.setup({
                show_time = false,
            })
        end
    }

    use {
        "stevearc/resession.nvim"
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
    }

    use {
        "LhKipp/nvim-nu"
    }


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
        }
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
        disable = true,
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

    use {
        "nvim-tree/nvim-tree.lua",
        requires = {
            { "nvim-tree/nvim-web-devicons" },
        }
    }

    use {
        "stevearc/overseer.nvim",
        config = function()
            require('overseer').setup()
        end
    }
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
