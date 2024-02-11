local notify = require('notify')
vim.notify = notify
local wk = require('which-key')

require('lsp-notify').setup()

wk.register({ ['<leader>d'] = { notify.dismiss, 'Dismiss notifications' } })
