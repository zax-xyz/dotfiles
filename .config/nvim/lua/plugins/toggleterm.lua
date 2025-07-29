local colors = require('catppuccin.palettes.mocha')

require("toggleterm").setup {
    open_mapping = [[<c-\>]],
    direction = "float",

    highlights = {
        FloatBorder = {
            guifg = colors.mauve,
        },
    },

    float_opts = {
        border = 'rounded',
        winblend = 10,
    },
}
