local ra_settings = {
    cargo = {
        features = "all"
    },
    checkOnSave = true,
}

if vim.fn.executable("cargo-clippy") == 1 then
    ra_settings.check = { command = "clippy" }
end

-- Don't have rustup available if using nix shell
if vim.fn.executable("rustup") == 1 then
    ra_settings.rustfmt = { extraArgs = { "+nightly" } }
end

return {
    settings = {
        ["rust-analyzer"] = ra_settings
    }
}
