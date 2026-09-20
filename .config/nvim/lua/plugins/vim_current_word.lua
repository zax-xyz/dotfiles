local colors = require('catppuccin.palettes').get_palette()

vim.api.nvim_set_hl(0, 'CurrentWord', { bg = colors.surface0 })
vim.api.nvim_set_hl(0, 'CurrentWordTwins', { bg = '#313244' })
