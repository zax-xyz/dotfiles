local bind = require('util.bind')

vim.g.mapleader = ' '
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Ignore case when searching, except when using uppercase
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Make command mode tab complete nicer
vim.opt.wildmode = 'longest,full'

-- Mappings timeout
vim.opt.timeoutlen = 350

-- Enable folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99
bind('n', '<leader>F', 'za')

-- Open splits at the bottom and right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Toggle paste mode with F2
vim.opt.pastetoggle = '<F2>'

-- Enable mouse control
vim.opt.mouse = 'a'
bind('n', '<ScrollWheelUp>', '<C-Y>')
bind('n', '<ScrollWheelDown>', '<C-E>')

if vim.fn.has("termguicolors") == 1 then
    vim.opt.termguicolors = true
end

-- Fix colors in tmux
vim.o.t_8f = [[\<Esc>[38;2;%lu;%lu;%lum]]
vim.o.t_8b = [[\<Esc>[48;2;%lu;%lu;%lum]]

-- Indentation rules
vim.opt.expandtab = true
local options = { 'tabstop', 'softtabstop', 'shiftwidth' }
for i = 1, #options do
    vim.opt[options[i]] = 4
end

vim.opt.re = 0
vim.opt.scrolloff = 3

-- Show trailing whitepace
local autocmd = vim.api.nvim_create_autocmd
autocmd('ColorScheme', {
    pattern = '*',
    callback = function()
        vim.api.nvim_set_hl(0, 'ExtraWhitespace', { bg = '#e06c75' })
    end,
})
vim.cmd([[match ExtraWhitespace /\s\+$/]])
autocmd('BufWinEnter', {
    pattern = '*',
    callback = function()
        if vim.bo.filetype ~= 'toggleterm' then
            vim.cmd [[match ExtraWhitespace /\s\+$/]]
        end
    end
})
autocmd('InsertEnter', {
    pattern = '*',
    command = [[match ExtraWhitespace /\s\+\%#\@<!$/]],
})
autocmd('InsertLeave', {
    pattern = '*',
    command = [[match ExtraWhitespace /\s\+$/]],
})
autocmd('BufWinLeave', {
    pattern = '*',
    callback = function()
        vim.fn.clearmatches()
    end
})
