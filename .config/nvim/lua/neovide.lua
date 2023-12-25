local bind = require('utils').bind

vim.g.gui_font_default_size = 10
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = 'Iosevka Term'

vim.g.neovide_transparency = 0.9
vim.g.neovide_background_color = '#1e1e2e'

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
