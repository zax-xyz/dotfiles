" Basics
let mapleader=" "
set encoding=utf-8
set nocompatible
set number
set relativenumber
set cursorline

" Ignore case when searching, except when using uppercase
set ignorecase smartcase

" Highlight search while typing
set incsearch
set hlsearch

" Tell me what command I'm typing
set showcmd

" Make command mode tab complete nicer
set wildmode=longest,full
set wildmenu

" Mappings timeout
set timeoutlen=350

" Set insert to normal mode timeout quicker
set ttimeoutlen=0

" Make vim faster
set ttyfast

" Mode cursors
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[1 q"

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <leader>F za

" Open splits at the bottom and right
set splitbelow
set splitright

" Allow opening a new tab when current buffer has unsaved changes
set hidden

" See partial off-screen lines
set display+=lastline

" Toggle paste mode with F2
set pastetoggle=<F2>

" Enable mouse control
set mouse=a
noremap <ScrollWheelUp> <C-Y>
noremap <ScrollWheelDown> <C-E>
if !has('nvim')
  set ttymouse=sgr
endif

" Use 24-bit (true-color) mode in Vim/Neovim
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

" Fix colors in tmux
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Indentation rules
set expandtab tabstop=2 softtabstop=2 shiftwidth=2

" Color scheme
syntax on
set background=dark

set re=0
set scrolloff=3

" Show trailing whitepace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=#e06c75
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
