local ssh_config = vim.fs.normalize((os.getenv("XDG_CONFIG_HOME") or "~/.config") .. "/ssh/config")

local config

if vim.fn.filereadable(ssh_config) == 1 then
    config = {
        connections = {
            ssh_configs = {
                ssh_config,
            },
            sshfs_args = {
                "-F " .. ssh_config,
            }
        }
    }
else
    config = {}
end

require("remote-sshfs").setup(config)
