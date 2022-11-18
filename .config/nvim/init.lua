vim.opt.runtimepath:prepend { "~/.vim" }
vim.opt.runtimepath:append { "~/.vim/after" }
vim.o.packpath = vim.o.runtimepath

require('basic')
require('plugins')
require('autocmd')
require('mappings')
require('gpg')

if vim.fn.exists('g:neovide') == 1 then
	require('neovide')
end
