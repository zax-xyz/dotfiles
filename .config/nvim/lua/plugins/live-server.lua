-- require('live-server').setup()
local bind = require("utils").bind
local vim_cmd = require('utils').vim_cmd

bind('n', '<leader>ls', vim_cmd('LiveServer toggle'), 'Toggle live server')
bind('n', '<leader>lm', vim_cmd('LiveServer'), 'Live server manager')
bind('n', '<leader>lo', vim_cmd('LiveServer open'), 'Open in browser')
bind('n', '<leader>ll', vim_cmd('LiveServer logs'), 'Live server logs')
