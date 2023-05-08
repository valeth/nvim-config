local nvim_tree = require("nvim-tree")
local nvim_tree_api = require("nvim-tree.api")

vim.keymap.set("n", "<Leader>ft", nvim_tree_api.tree.open)

nvim_tree.setup({
    view = {
        float = {
            enable = true
        }
    }
})


local ssh_config = vim.fs.normalize((os.getenv("XDG_CONFIG_HOME") or "~/.config") .. "/ssh/config")

require("remote-sshfs").setup({
    connections = {
        ssh_configs = {
            ssh_config,
        },
        sshfs_args = {
            "-F " .. ssh_config,
        }
    }
})
