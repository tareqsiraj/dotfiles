if not vim.g.neovide then
    return
end

vim.o.guifont = "FiraCode Nerd Font:h12"
vim.g.neovide_scroll_animation_length = 0.1
vim.g.neovide_cursor_animation_length = 0.002
vim.g.neovide_cursor_animate_in_insert_mode = false
vim.g.neovide_cursor_trail_size = 0.1
vim.g.neovide_cursor_vfx_mode = "ripple"

-- https://github.com/neovide/neovide/issues/1325
-- vim.g.neovide_font_hinting = "none"
-- vim.g.neovide_font_edging = "subpixelantialias"
