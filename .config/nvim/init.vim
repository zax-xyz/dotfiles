set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" let g:python_host_prog = '~/.venvs/neovim2/bin/python'
" let g:python3_host_prog = '~/.venvs/neovim3/bin/python'

lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- Modules and its options go here
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
}
EOF
