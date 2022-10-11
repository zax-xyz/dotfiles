local bind = require('util.bind')

vim.g.gui_font_default_size = 9
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = 'Iosevka Term Extended'

vim.g.neovide_transparency = 0.95
vim.g.neovide_background_color = '#282c34'

RefreshGuiFont = function()
  vim.opt.guifont = string.format("%s:h%s",vim.g.gui_font_face, vim.g.gui_font_size)
end

ResizeGuiFont = function(delta)
  vim.g.gui_font_size = vim.g.gui_font_size + delta
  RefreshGuiFont()
end

ResetGuiFont = function ()
  vim.g.gui_font_size = vim.g.gui_font_default_size
  RefreshGuiFont()
end

-- Call function on startup to set default value
ResetGuiFont()

bind({'n', 'i'}, "<C-+>", function() ResizeGuiFont(1) end)
bind({'n', 'i'}, "<C-=>", function() ResizeGuiFont(1)  end)
bind({'n', 'i'}, "<A-S-k>", function() ResizeGuiFont(1)  end)
bind({'n', 'i'}, "<C-->", function() ResizeGuiFont(-1) end)
bind({'n', 'i'}, "<A-S-j>", function() ResizeGuiFont(-1)  end)
bind({'n', 'i'}, "<C-BS>", ResetGuiFont)
