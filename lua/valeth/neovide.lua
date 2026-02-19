if not vim.g.neovide then
    return
end

-- Disable cursor animation
vim.g.neovide_cursor_animation_length = 0

-- Disable scroll animation, because this also affects buffer switching
vim.g.neovide_scroll_animation_length = 0

-- Emulate Alacritty font rendering
vim.g.neovide_text_gamma = 0.8
vim.g.neovide_text_contrast = 0.1

vim.g.neovide_floating_corner_radius = 0.5

vim.g.neovide_hide_mouse_when_typing = true

vim.g.neovide_refresh_rate_idle = 10

-- vim.g.neovide_fullscreen = true

-- Background of floating windows will be blurred only if there is transparency,
-- but background blur is currently not supported on Linux
-- vim.g.neovide_opacity = 0.99
-- vim.g.neovide_floating_blur_amount_x = 2.0
-- vim.g.neovide_floating_blur_amount_y = 2.0
