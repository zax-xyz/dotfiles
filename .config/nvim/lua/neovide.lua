local bind = require('utils').bind

vim.g.gui_font_default_size = 9
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = 'Iosevka Nerd Font Mono'
vim.g.neovide_scroll_animation_length = 0.2
vim.opt.linespace = 6
-- local padding_dirs = {"top", "bottom", "right", "left"}
-- for _, dir in ipairs(padding_dirs) do
--     vim.g["neovide_padding_" .. dir] = 36
-- end

-- vim.g.neovide_opacity = 0.95
-- vim.g.neovide_window_blurred = true
-- vim.g.neovide_background_color = '#1e1e2e'

local refreshGuiFont = function()
    vim.opt.guifont = string.format("%s:h%s:e-subpixelantialias:#h-slight", vim.g.gui_font_face, vim.g.gui_font_size)
end

local resizeGuiFont = function(delta)
    vim.g.gui_font_size = vim.g.gui_font_size + delta
    refreshGuiFont()
end

local resetGuiFont = function()
    vim.g.gui_font_size = vim.g.gui_font_default_size
    refreshGuiFont()
end

-- Call function on startup to set default value
resetGuiFont()

local delta = 0.5

bind({ 'n', 'i' }, "<C-+>", function() resizeGuiFont(delta) end, "<Neovide> Increase font size")
bind({ 'n', 'i' }, "<C-=>", function() resizeGuiFont(delta) end, "<Neovide> Increase font size")
bind({ 'n', 'i' }, "<A-S-k>", function() resizeGuiFont(delta) end, "<Neovide> Increase font size")
bind({ 'n', 'i' }, "<C-->", function() resizeGuiFont(-delta) end, "<Neovide> Decrease font size")
bind({ 'n', 'i' }, "<A-S-j>", function() resizeGuiFont(-delta) end, "<Neovide> Decrease font size")
bind({ 'n', 'i' }, "<C-BS>", resetGuiFont, "<Neovide> Reset font size")

bind(
    {'n', 'v', 's', 'x', 'o', 'i', 'l', 'c', 't'},
    '<D-v>',
    function() vim.api.nvim_paste(vim.fn.getreg('+'), true, -1) end,
    "Paste"
)

-- vim.g.neovide_floating_blur_amount_x = 8.0
-- vim.g.neovide_floating_blur_amount_y = 8.0

-- vim.g.neovide_floating_shadow = false
vim.g.neovide_floating_corner_radius = 0.2
vim.g.neovide_show_border = true

-- vim.o.winblend = 80
-- vim.o.pumblend = 80
