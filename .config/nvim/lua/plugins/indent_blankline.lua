local colors = require('catppuccin.palettes.mocha')

vim.api.nvim_set_hl(0, 'IndentBlankLineContextChar', {bg = 'NONE', fg = colors.surface2})

require("indent_blankline").setup {
    show_current_context = true,
    use_terrsitter = true,
}
