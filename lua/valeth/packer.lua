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

local spec = function(use)
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
                return require("packer.util").float({ border = "single" })
            end
        }
    }
}
