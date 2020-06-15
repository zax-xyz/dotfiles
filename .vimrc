" Basics
let mapleader=" "
set encoding=utf-8
set nocompatible
set number
set relativenumber
set cursorline

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

" Visual plugins
Plug 'laggardkernel/vim-one'  " Fork of rakr's vim-one with lower impact on startup time
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Functionality
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'sirver/ultisnips'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Extra wacky shit that goes on the screen
Plug 'itchyny/lightline.vim'  " Both powerline and airline add at least 20 minutes to my startup time
Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'

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

" Linting
Plug 'w0rp/ale'  "Syntastic freezes vim for another 20 minutes, I need an asynchronous alternative
Plug 'maximbaz/lightline-ale'

call plug#end()

" Cursors
" block cursor on enter vim
autocmd VimEnter * silent exec "! echo -ne '\e[1 q'"
" line cursor on leave vim
autocmd VimLeave * silent exec "! echo -ne '\e[5 q'"

" Mode cursors
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[1 q"

" Autodetect filetype
noremap <leader>r :filetype detect<CR>

" Find files with fzf
noremap <leader>f :Files<CR>
noremap <leader>g :GFiles<CR>

noremap <leader>G :Goyo<CR>

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = '#777777'
let g:limelight_conceal_guifg = '#777777'
let g:limelight_default_coefficient = 0.7

" Fix goyo messing up the background on leave
function! s:goyo_leave()
  hi! Normal ctermbg=NONE guibg=NONE
  hi! NonText ctermbg=NONE guibg=NONE
endfunction

function! s:goyo_enter()
  Limelight
endfunction

autocmd! User GoyoLeave nested call <SID>goyo_leave()
" autocmd! User GoyoEnter nested call <SID>goyo_enter()

" Open splits at the bottom and right
set splitbelow
set splitright

" Split navigation
noremap <C-H> <C-W><C-H>
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>

" Allow opening a new tab when current buffer has unsaved changes
set hidden

" Tab controls
map <C-n> <Plug>(wintabs_next)
map <C-p> <Plug>(wintabs_previous)
map <C-t>c <Plug>(wintabs_close)
map <C-t>u <Plug>(wintabs_undo)
map <C-t>o <Plug>(wintabs_only)
map <C-w>c <Plug>(wintabs_close_window)
map <C-w>o <Plug>(wintabs_only_window)
command! Tabc WintabsCloseVimtab
command! Tabo WintabsOnlyVimtab

noremap <C-t>n :tabn<CR>
noremap <C-t>p :tabp<CR>
noremap <C-]> :tabn<CR>

" See partial off-screen lines
set display+=lastline

" Visual line navigation
noremap <Up> gk
inoremap <Up> <Esc>gka
noremap <Down> gj
inoremap <Down> <Esc>gja

" Guide navigation
noremap <leader><leader> /<++><CR>c4l
noremap <leader><Tab> /<++><CR>

" Replace all quicker
noremap <leader>s :s//g<Left><Left>
noremap <leader>S :%s//g<Left><Left>

" Quick norm
noremap <leader>n :norm 

" Toggle paste mode with F2
set pastetoggle=<F2>

" Enable mouse control
set mouse=a
noremap <ScrollWheelUp> <C-Y>
noremap <ScrollWheelDown> <C-E>
if !has('nvim')
  set ttymouse=sgr
endif

" Python syntax highlighting
let g:python_highlight_all = 1
" let g:python_slow_sync = 0

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <leader>F za

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

" Color scheme
syntax on
set background=dark
let g:one_allow_italics = 1
colorscheme one

" au FileType python hi Constant ctermfg=yellow guifg=#e5c07b
au FileType python hi link pythonNone Structure

" Save files as root
cmap w!! w !sudo tee > /dev/null %

" Indentation rules
set expandtab tabstop=2 softtabstop=2 shiftwidth=2
au FileType python,c,go setlocal tabstop=4 softtabstop=4 shiftwidth=4
au FileType go setlocal noexpandtab

au FileType plaintex setlocal filetype=tex
au FileType rmd setlocal filetype=markdown

" Markdown heading colours
autocmd FileType markdown highlight htmlH1 ctermfg=blue

" Compile documents
noremap <leader>c :w<CR>:!true \| ~/.scripts/compile "%" &> /dev/null & disown<CR><CR>
inoremap <C-c> <Esc>:w<CR>:!true \| ~/.scripts/compile "%" &> /dev/null & disown<CR><CR>
au FileType markdown nmap <leader>C :w<CR>:!~/.scripts/compile "%" 1000 &> /dev/null & disown<CR><CR>

au FileType tex,markdown,nroff setlocal spell
noremap <leader>s :setlocal spell!<CR>
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

set conceallevel=2
let g:tex_conceal='abdmg'
let g:vimtex_matchparen_enabled=0
let g:vimtex_motion_enabled=0
let g:vimtex_view_method='zathura'

noremap <leader>v :VimtexView<CR>

hi Conceal guibg=NONE guifg=#e5c07b

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

" Transparent background in terminal
if (!has("gui_running"))
  hi! Normal ctermbg=NONE guibg=NONE
  hi! NonText ctermbg=NONE guibg=NONE
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

function! WordCount()
  let s:old_status = v:statusmsg
  let position = getpos(".")
  exe ":silent normal g\<c-g>"
  let stat = v:statusmsg
  let s:word_count = 0
  if stat != '--No lines in buffer--'
    let s:word_count = str2nr(split(v:statusmsg)[11])
    let v:statusmsg = s:old_status
  end
  call setpos('.', position)
  return s:word_count
endfunction

" Lightline
let g:lightline = {
  \   'colorscheme': 'one',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'readonly', 'filename', 'modified' ]
  \     ],
  \     'right':[ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
  \               [ 'lineinfo' ],
  \               [ 'fileformat', 'fileencoding', 'filetype' ],
  \               [ 'bytecount' ]
  \     ]
  \   },
  \   'component': {
  \     'lineinfo': ' %3l:%-2v %{line("$")}',
  \     'linecount': "%{line('$')}",
  \     'bytecount': "%{line2byte('$') + len(getline('$'))}",
  \     'wordcount': '%{WordCount()}',
  \   },
  \   'component_function': {
  \     'fileformat': 'LightlineFileformat',
  \     'filetype': 'LightlineFiletype',
  \     'fileencoding': 'LightlineFileencoding',
  \   },
  \   'component_expand': {
  \     'linter_checking': 'lightline#ale#checking',
  \     'linter_warnings': 'lightline#ale#warnings',
  \     'linter_errors': 'lightline#ale#errors',
  \     'linter_ok': 'lightline#ale#ok',
  \     'buffers': 'lightline#bufferline#buffers',
  \   },
  \   'component_type': {
  \     'linter_checking': 'left',
  \     'linter_warnings': 'warning',
  \     'linter_errors': 'error',
  \     'linter_ok': 'left',
  \     'buffers': 'tabsel',
  \   },
  \   'separator': {
  \     'left': '', 'right': ''
  \   },
  \   'subseparator': {
  \     'left': '', 'right': ''
  \   },
  \}

set laststatus=2

function! LightlineFileformat()
  return winwidth(0) > 90 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 75 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 90 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

let g:lightline#ale#indicator_checking = '...'
let g:lightline#ale#indicator_ok = ''

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

let g:ale_list_window_size = 3
nnoremap <silent> <leader>J :ALENext<cr>
nnoremap <silent> <leader>K :ALEPrevious<cr>
nnoremap <silent> <right> :ALENext<cr>
nnoremap <silent> <left> :ALEPrevious<cr>
nnoremap <silent> <leader>a :ALEToggle<cr>

" Don't save backups of *.gpg files
set backupskip+=*.gpg
" To avoid that parts of the file is saved to .viminfo when yanking or
" deleting, empty the 'viminfo' option.
"set viminfo=

augroup encrypted
  au!
  " Disable swap files, and set binary file format before reading the file
  autocmd BufReadPre,FileReadPre *.gpg
    \ setlocal noswapfile bin viminfo=
  " Decrypt the contents after reading the file, reset binary file format
  " and run any BufReadPost autocmds matching the file name without the .gpg
  " extension
  autocmd BufReadPost,FileReadPost *.gpg
    \ execute "'[,']!gpg -q --decrypt --default-recipient-self" |
    \ setlocal nobin |
    \ execute "doautocmd BufReadPost " . expand("%:r")
  " Set binary file format and encrypt the contents before writing the file
  autocmd BufWritePre,FileWritePre *.gpg
    \ setlocal bin |
    \ '[,']!gpg --encrypt --default-recipient-self
  " After writing the file, do an :undo to revert the encryption in the
  " buffer, and reset binary file format
  autocmd BufWritePost,FileWritePost *.gpg
    \ silent u |
    \ setlocal nobin
augroup END

let g:wrap = 0

function ToggleWrap()
  if !g:wrap
    let g:wrap = 1
    echo "Wrap ON"
    setlocal linebreak
    noremap  <buffer> <silent> k      gk
    noremap  <buffer> <silent> j      gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  else
    let g:wrap = 0
    echo "Wrap OFF"
    setlocal nolinebreak
    silent! nunmap <buffer> k
    silent! nunmap <buffer> j
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  endif
endfunction

noremap <silent> <Leader>w :call ToggleWrap()<CR>
