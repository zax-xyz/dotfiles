-- Basics
vim.g.mapleader = ' '
vim.opt.encoding = 'utf-8'
vim.opt.compatible = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Ignore case when searching, except when using uppercase
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Highlight search while typing
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Tell me what command I'm typing
vim.opt.showcmd = true

-- Make command mode tab complete nicer
vim.opt.wildmode = 'longest,full'
vim.opt.wildmenu = true

-- Mappings timeout
vim.opt.timeoutlen = 350

-- Make vim faster
vim.opt.ttyfast = true

-- Mode cursors
vim.o.t_SI = [[\<Esc>[5 q]]
vim.o.t_SR = [[\<Esc>[3 q]]
vim.o.t_EI = [[\<Esc>[1 q]]

-- Enable folding
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99
vim.keymap.set('n', '<leader>F', 'za', {noremap = true})

-- Open splits at the bottom and right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Allow opening a new tab when current buffer has unsaved changes
vim.opt.hidden = true

-- Toggle paste mode with F2
vim.opt.pastetoggle = '<F2>'

-- Enable mouse control
vim.opt.mouse = 'a'
vim.keymap.set('n', '<ScrollWheelUp>', '<C-Y>', {noremap = true})
vim.keymap.set('n', '<ScrollWheelDown>', '<C-E>', {noremap = true})

if vim.fn.has("termguicolors") == 1 then
    vim.opt.termguicolors = true
end

-- Fix colors in tmux
vim.o.t_8f = [[\<Esc>[38;2;%lu;%lu;%lum]]
vim.o.t_8b = [[\<Esc>[48;2;%lu;%lu;%lum]]

-- Indentation rules
vim.opt.expandtab = true
local options = {'tabstop', 'softtabstop', 'shiftwidth'}
for i = 1, #options do
    vim.opt[options[i]] = 4
end

-- Color scheme
vim.opt.background = 'dark'

vim.opt.re = 0
vim.opt.scrolloff = 3

-- Show trailing whitepace
local autocmd = vim.api.nvim_create_autocmd
autocmd('ColorScheme', {
    pattern = '*',
    callback = function()
        vim.api.nvim_set_hl(0, 'ExtraWhitespace', {bg = '#e06c75'})
    end,
})
vim.cmd([[match ExtraWhitespace /\s\+$/]])
autocmd('BufWinEnter', {
    pattern = '*',
    command = [[match ExtraWhitespace /\s\+$/]],
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
