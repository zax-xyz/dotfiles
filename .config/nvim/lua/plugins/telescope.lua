local bind = require('utils').bind
local telescope = require('telescope.builtin')

bind('', '<leader>f', telescope.find_files)
bind('', '<leader>g', telescope.git_files)
bind('', '<leader>b', telescope.buffers)
bind('', '<leader>lg', telescope.live_grep)
