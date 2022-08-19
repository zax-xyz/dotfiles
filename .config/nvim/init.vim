set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

luafile ~/.config/nvim/basic.lua
source ~/.config/nvim/plugins.vim
luafile ~/.config/nvim/autocmd.lua
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/gpg.vim

if !exists('g:vscode')
  source ~/.config/nvim/gui.vim
endif

" let g:python_host_prog = '~/.venvs/neovim2/bin/python'
" let g:python3_host_prog = '~/.venvs/neovim3/bin/python'
