" Install vim-plug if it is not found, then install plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Update plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Load plugins
call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'laggardkernel/vim-one'  " Fork of rakr's vim-one with lower impact on startup time

" Functionality
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'sirver/ultisnips'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ycm-core/YouCompleteMe'

" Extra wacky shit that goes on the screen
Plug 'itchyny/lightline.vim'  " Both powerline and airline add at least 20 minutes to my startup time
Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'majutsushi/tagbar'

" Language-related plugins
Plug 'vim-python/python-syntax'
Plug 'vim-scripts/indentpython.vim'
Plug 'lepture/vim-jinja'
Plug 'plasticboy/vim-markdown'
Plug 'posva/vim-vue'
Plug 'digitaltoad/vim-pug'
Plug 'iloginow/vim-stylus'
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'turbio/bracey.vim'  " Live edit html/css/js
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'leafgarland/typescript-vim'

" Linting
Plug 'w0rp/ale'  "Syntastic freezes vim for another 20 minutes, I need an asynchronous alternative
Plug 'maximbaz/lightline-ale'

Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

call plug#end()
