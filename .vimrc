source ~/.config/nvim/basic.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/autocmd.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/gpg.vim

if !exists('g:vscode')
  source ~/.config/nvim/theme.vim
  source ~/.config/nvim/gui.vim

  " Plugin specific
  " source ~/.config/nvim/plugins/ultisnips.vim
  " source ~/.config/nvim/plugins/ycm.vim
  source ~/.config/nvim/plugins/coc.vim
  " source ~/.config/nvim/plugins/supertab.vim
  source ~/.config/nvim/plugins/lightline.vim
  source ~/.config/nvim/plugins/wintabs.vim
  " source ~/.config/nvim/plugins/nerdtree.vim
  source ~/.config/nvim/plugins/indentLine.vim
  source ~/.config/nvim/plugins/python.vim
  source ~/.config/nvim/plugins/markdown.vim
  source ~/.config/nvim/plugins/tex.vim
  source ~/.config/nvim/plugins/emmet.vim
  source ~/.config/nvim/plugins/java.vim
  source ~/.config/nvim/plugins/JavaImp.vim
  " source ~/.config/nvim/plugins/ale.vim
  source ~/.config/nvim/plugins/matchup.vim
  source ~/.config/nvim/plugins/vim-vue.vim
  source ~/.config/nvim/plugins/gitgutter.vim
  source ~/.config/nvim/plugins/vim_current_word.vim
endif
