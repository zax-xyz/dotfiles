set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.config/nvim/basic.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/autocmd.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/gpg.vim

if !exists('g:vscode')
  source ~/.config/nvim/gui.vim
endif

" let g:python_host_prog = '~/.venvs/neovim2/bin/python'
" let g:python3_host_prog = '~/.venvs/neovim3/bin/python'
