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
