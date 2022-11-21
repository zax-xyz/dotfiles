local bind = require('util.bind')

vim.g.gui_font_default_size = 8
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = 'Iosevka Term Extended'

vim.g.neovide_transparency = 0.95
vim.g.neovide_background_color = '#1e1e2e'

local refreshGuiFont = function()
  vim.opt.guifont = string.format("%s:h%s",vim.g.gui_font_face, vim.g.gui_font_size)
end

local resizeGuiFont = function(delta)
  vim.g.gui_font_size = vim.g.gui_font_size + delta
  refreshGuiFont()
end

local resetGuiFont = function ()
  vim.g.gui_font_size = vim.g.gui_font_default_size
  refreshGuiFont()
end

-- Call function on startup to set default value
resetGuiFont()

bind({'n', 'i'}, "<C-+>", function() resizeGuiFont(1) end)
bind({'n', 'i'}, "<C-=>", function() resizeGuiFont(1)  end)
bind({'n', 'i'}, "<A-S-k>", function() resizeGuiFont(1)  end)
bind({'n', 'i'}, "<C-->", function() resizeGuiFont(-1) end)
bind({'n', 'i'}, "<A-S-j>", function() resizeGuiFont(-1)  end)
bind({'n', 'i'}, "<C-BS>", resetGuiFont)
