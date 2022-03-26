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

" Functionality
Plug 'tpope/vim-surround'
" Plug 'godlygeek/tabular'
" Plug 'jiangmiao/auto-pairs'
" Plug 'sirver/ultisnips'
" Plug 'ycm-core/YouCompleteMe'
" Plug 'ervandew/supertab'
" Plug 'tpope/vim-sleuth'
Plug 'AndrewRadev/splitjoin.vim'

if !exists('g:vscode')
  " Plug 'laggardkernel/vim-one'  " Fork of rakr's vim-one with lower impact on startup time
  " Plug 'joshdick/onedark.vim'
  Plug 'navarasu/onedark.nvim'
  " Plug 'olimorris/onedarkpro.nvim'
  " Plug 'christianchiarulli/nvcode-color-schemes.vim'

  Plug 'tpope/vim-commentary'
  Plug 'suy/vim-context-commentstring'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ciaranm/detectindent'
  Plug 'andymass/vim-matchup'
  " Plug 'prettier/vim-prettier', {
  " \ 'do': 'yarn install',
  " \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html', 'java'] }
  " Plug 'sbdchd/neoformat'
  " autocmd BufWritePre *.js,*.java Neoformat
  " Plug 'codota/tabnine-vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'dominikduda/vim_current_word'

  " Extra wacky shit that goes on the screen
  Plug 'itchyny/lightline.vim'  " Both powerline and airline add at least 20 minutes to my startup time
  Plug 'zefei/vim-wintabs'
  Plug 'zefei/vim-wintabs-powerline'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  " Plug 'scrooloose/nerdtree'
  " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  " Plug 'ryanoasis/vim-devicons'
  " Plug 'lambdalisue/fern.vim'
  Plug 'majutsushi/tagbar'
  " Plug 'Yggdroot/indentLine'
  " Plug 'thaerkh/vim-indentguides'

  " Language-related plugins
  " Plug 'vim-python/python-syntax'
  " Plug 'vim-scripts/indentpython.vim'
  " Plug 'lepture/vim-jinja'
  " Plug 'plasticboy/vim-markdown'
  " Plug 'posva/vim-vue'
  " Plug 'leafOfTree/vim-vue-plugin'
  Plug 'digitaltoad/vim-pug'
  Plug 'iloginow/vim-stylus'
  Plug 'lervag/vimtex'
  Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
  Plug 'turbio/bracey.vim'
  " Plug 'pangloss/vim-javascript'
  Plug 'mattn/emmet-vim'
  " Plug 'leafgarland/typescript-vim'
  " Plug 'HerringtonDarkholme/yats.vim'
  " Plug 'uiiaoo/java-syntax.vim'
  Plug 'rustushki/JavaImp.vim'
  " Plug 'octol/vim-cpp-enhanced-highlight'
  " Plug 'jeaye/color_coded'
  " Plug 'maxmellon/vim-jsx-pretty'
  " Plug 'styled-components/vim-styled-components'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  Plug 'github/copilot.vim'
endif

" Linting
" Plug 'w0rp/ale'  "Syntastic freezes vim for another 20 minutes, I need an asynchronous alternative
" Plug 'maximbaz/lightline-ale'
" i use coc for linting now

" Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

call plug#end()
