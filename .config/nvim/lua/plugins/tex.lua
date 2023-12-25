local bind = require('utils').bind
local vim_cmd = require('utils').vim_cmd

vim.opt.conceallevel = 2
vim.opt.concealcursor = ''

vim.g.tex_conceal = 'abdmg'
vim.g.vimtex_motion_enabled = 0
vim.g.vimtex_view_method = 'zathura'
vim.g.tex_flavor = 'latex'

vim.api.nvim_set_hl(0, 'Conceal', { bg = 'NONE', fg = '#e5c07b' })

bind('', '<leader>v', vim_cmd('VimtexView'), "Open with vimtex")
