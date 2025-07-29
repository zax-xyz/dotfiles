local fidget = require("fidget")
fidget.setup({
    notification = {
        override_vim_notify = true,
        window = {
            max_height = 15,
            winblend = 0,
        },
    },
})

local wk = require('which-key')
wk.register({ ['<leader>d'] = { fidget.notification.clear, 'Dismiss notifications' } })
