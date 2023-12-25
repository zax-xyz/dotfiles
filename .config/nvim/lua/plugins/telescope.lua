local bind = require('utils').bind
local telescope = require('telescope.builtin')

bind('', '<leader>f', telescope.find_files, "Find files")
bind('', '<leader>gg', telescope.git_files, "Search git files")
bind('', '<leader>b', telescope.buffers, "Search buffers")
bind('', '<leader>lg', telescope.live_grep, "Live grep")
