local colors = require('catppuccin.palettes.mocha')

vim.api.nvim_set_hl(0, 'IblIndent', { bg = 'NONE', fg = colors.surface0 })
vim.api.nvim_set_hl(0, 'IblScope', { bg = 'NONE', fg = colors.lavender })

require("ibl").setup({
    scope = {
        show_start = false,
        show_end = false,
    }
})
