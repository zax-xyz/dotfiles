" Basics
let mapleader=" "
set encoding=utf-8
set nocompatible
set number
set relativenumber
set cursorline

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Load plugins
call plug#begin('~/.vim/plugged')

Plug 'laggardkernel/vim-one' " Fork of rakr's vim-one with lower impact on startup time
Plug 'itchyny/lightline.vim' " Both powerline and airline add at least 20 minutes to my startup time
Plug 'vim-python/python-syntax'
Plug 'vim-scripts/indentpython.vim'
Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'
Plug 'scrooloose/nerdtree'
Plug 'lepture/vim-jinja'
" Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale' " Syntastic freezes vim for another 20 minutes, I need an asynchronous alternative
Plug 'maximbaz/lightline-ale'
" Plug 'yuttie/comfortable-motion.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'mboughaba/i3config.vim'
Plug 'posva/vim-vue'
Plug 'digitaltoad/vim-pug'
Plug 'iloginow/vim-stylus'
" Plug 'lifepillar/vim-mucomplete'

call plug#end()

" Cursors
" block cursor on enter vim
autocmd VimEnter * silent exec "! echo -ne '\e[1 q'"
" line cursor on leave vim
autocmd VimLeave * silent exec "! echo -ne '\e[5 q'"

let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[1 q"

nmap <leader>r :filetype detect<CR>
nmap <leader>F :set ft=

nnoremap <leader>g :Goyo<CR>

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = '#777777'
let g:limelight_conceal_guifg = '#777777'
let g:limelight_default_coefficient = 0.7

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
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" inoremap {      {}<Left>
" inoremap {<CR>  {<CR>}<Esc>O
" inoremap {{     {
" inoremap {}     {}

" inoremap (      ()<Left>
" inoremap (<CR>  (<CR>)<Esc>O
" inoremap ((     (
" inoremap ()     ()

" inoremap [      []<Left>
" inoremap [<CR>  [<CR>]<Esc>O
" inoremap [[     [
" inoremap []     []

" Buffers
" set hidden
" nnoremap <C-n> :bnext<CR>
" nnoremap <C-p> :bprev<CR>

map <C-n> <Plug>(wintabs_next)
map <C-p> <Plug>(wintabs_previous)
map <C-t>c <Plug>(wintabs_close)
map <C-t>u <Plug>(wintabs_undo)
map <C-t>o <Plug>(wintabs_only)
map <C-w>c <Plug>(wintabs_close_window)
map <C-w>o <Plug>(wintabs_only_window)
command! Tabc WintabsCloseVimtab
command! Tabo WintabsOnlyVimtab

"let g:multi_cursor_use_default_mapping=0

" See partial off-screen lines
set display+=lastline

" Visual line navigation
map <Up> gk
imap <Up> <Esc>gka
map <Down> gj
imap <Down> <Esc>gja

" Make indentation outside of Insert mode easier
nmap <Tab> >>_
nmap <S-Tab> <<_
imap <S-Tab> <C-D>
vmap <Tab> >gv
vmap <S-Tab> <gv

" Guide navigation
" map \\ /<++><CR>c4l
map <leader><leader> /<++><CR>c4l
" imap \\ <Esc>/<++><CR>c4l
map <leader><Tab> /<++><CR>

" Replace all quicker
map <leader>s :s//g<Left><Left>
map <leader>S :%s//g<Left><Left>

" Quick norm
map <leader>n :norm 

" Toggle paste mode with F2
set pastetoggle=<F2>

" Enable mouse control
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
if !has('nvim')
  set ttymouse=sgr
endif

" Python syntax highlighting
let g:python_highlight_all = 1
let g:python_slow_sync = 0

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <leader>f za

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

" Set insert to normal mode timeout quicker
set timeoutlen=1000 ttimeoutlen=0

" Make vim faster
set ttyfast

" Color scheme
syntax on
set background=dark
let g:one_allow_italics = 1
colorscheme one

" Save files as root
cmap w!! w !sudo tee > /dev/null %

set expandtab tabstop=4 softtabstop=4 shiftwidth=4
au FileType javascript,html,css,php,vim,json,xml,zsh,yaml,go,sh,tex
  \ set tabstop=2 softtabstop=2 shiftwidth=2
au FileType go,c
  \ set noexpandtab

au FileType plaintex set filetype=tex
au FileType rmd set filetype=markdown

" Markdown heading colours
autocmd FileType markdown highlight htmlH1 ctermfg=blue

" Compile documents
nmap <leader>c :w<CR>:!~/.scripts/compile "%" &> /dev/null & disown<CR><CR>
au FileType markdown nmap <leader>C :w<CR>:!~/.scripts/compile "%" 1000 &> /dev/null & disown<CR><CR>

au FileType tex,markdown,nroff setlocal spell
nnoremap <leader>s :setlocal spell!<CR>

let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

" Autostart NERDTree
"nmap <leader>t NERDTree | vertical resize -15 | wincmd l
"au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


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
  \               [ 'bytecount', 'wordcount' ]
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
nmap <silent> <leader>J :ALENext<cr>
nmap <silent> <leader>K :ALEPrevious<cr>
nmap <silent> <right> :ALENext<cr>
nmap <silent> <left> :ALEPrevious<cr>
nmap <silent> <leader>a :ALEToggle<cr>

" PHP/HTML
au FileType php,html imap ,b <b></b> <++><Esc>FbT>i
au FileType php,html imap ,it <em></em> <++><Esc>FeT>i
au FileType php,html imap ,1 <h1></h1><Enter><++><Esc>0kf>a
au FileType php,html imap ,2 <h2></h2><Enter><++><Esc>0kf>a
au FileType php,html imap ,3 <h3></h3><Enter><++><Esc>0kf>a
au FileType php,html imap ,4 <h4></h4><Enter><++><Esc>0kf>a
au FileType php,html imap ,5 <h5></h5><Enter><++><Esc>0kf>a
au FileType php,html imap ,6 <h6></h6><Enter><++><Esc>0kf>a
au FileType php,html imap ,p <p></p><Enter><++><Esc>0kf>a
au FileType php,html imap ,a <a href=""><++></a> <++><Esc>14hi
au FileType php,html imap ,e <a target="_blank" href=""><++></a> <++><Esc>14hi
au FileType php,html imap ,ul <ul><Enter><li></li><Enter></ul><Enter><++><Esc>02kf>a
au FileType php,html imap ,li <Esc>o<li></li><Esc>F>a
au FileType php,html imap ,ol <ol><Enter><li></li><Enter></ol><Enter><++><Esc>02kf>a
au FileType php,html imap ,im <img src="" alt="<++>"><++><esc>Fcf"a
au FileType php,html imap ,td <Esc>o<td></td><Esc>Fdcit
au FileType php,html imap ,tr <Esc>o<tr><Enter></tr><Esc>kA,td
au FileType php,html imap ,th <th></th><++><Esc>Fhcit
au FileType php,html imap ,tab <table><Enter></table><Esc>kA,tr
au FileType php,html imap ,gr <font color="green"></font><Esc>F>a
au FileType php,html imap ,rd <font color="red"></font><Esc>F>a
au FileType php,html imap ,yl <font color="yellow"></font><Esc>F>a
au FileType php,html imap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
au FileType php,html imap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
au FileType php,html imap &<Space> &amp;<Space>
au FileType php,html imap <<Space> &lt;

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
    \ execute "'[,']!gpg --decrypt --default-recipient-self" |
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

noremap <silent> <Leader>w :call EnableWrap()<CR>
function EnableWrap()
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
endfunction

noremap <silent> <Leader>W :call DisableWrap()<CR>
function DisableWrap()
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
endfunction

" set viminfo='10,\"100,:20,%,n~/.viminfo

" LATEX
autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,li <Enter>\item<Space>
autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,bt {\blindtext}
autocmd FileType tex inoremap ,nu $\varnothing$
autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
autocmd FileType tex inoremap ,rn (\ref{})<++><Esc>F}i
autocmd FileType tex inoremap ,un \underline{}<++><Esc>F}i
autocmd FileType tex inoremap ,pa \paragraph{} <++><Esc>F}i

autocmd FileType tex inoremap ,fi \field{} <++><Esc>F}i

" LATEX MATH
autocmd FileType tex,markdown inoremap ,fc \frac{}{<++>} <++><Esc>2T{i
autocmd FileType tex,markdown inoremap ,bin \binom{}{<++>}<Esc>2T{i
autocmd FileType tex,markdown inoremap ,ali \begin{align*}<CR> &= <++> \\<CR>\end{align*}<CR><CR><++><Esc>03kt&i
autocmd FileType tex,markdown inoremap ,gat \begin{gather*}<CR> &= <++> \\<CR>\end{gather*}<CR><CR><++><Esc>03kt&i
autocmd FileType tex,markdown inoremap ,ln <Esc>o &= <++> \\<Esc>F&hi
autocmd FileType tex,markdown nnoremap ,ln <Esc>o &= <++> \\<Esc>F&hi
autocmd FileType tex,markdown inoremap ,int \int_{}^{<++>} <++><Esc>2T{i
autocmd FileType tex,markdown inoremap ,inl \int\limits_{}^{<++>} <++><Esc>2T{i
autocmd FileType tex,markdown inoremap ,sum \sum_{}^{<++>} <++><Esc>2T{i
autocmd FileType tex,markdown inoremap ,sul \sum\limits_{}^{<++>} <++><Esc>2T{i
autocmd FileType tex,markdown inoremap ,bigint \mathlarger{\int}
autocmd FileType tex,markdown inoremap ,te \text{} <++><Esc>T{i
autocmd FileType tex,markdown inoremap ,pe _\perp
autocmd FileType tex,markdown inoremap ,vec \overrightarrow{} <++><Esc>T{i

" LATEX SYMBOLS
autocmd FileType tex inoremap ,la \leftarrow
autocmd FileType tex inoremap ,La \Leftarrow
autocmd FileType tex inoremap ,ra \rightarrow
autocmd FileType tex inoremap ,Ra \Rightarrow
autocmd FileType tex inoremap ,lra \leftrightarrow
autocmd FileType tex inoremap ,Lra \Leftrightarrow
autocmd FileType tex inoremap ,ua \uparrow
autocmd FileType tex inoremap ,Ua \Uparrow
autocmd FileType tex inoremap ,da \downarrow
autocmd FileType tex inoremap ,Da \Downarrow
autocmd FileType tex inoremap ,uda \updownarrow
autocmd FileType tex inoremap ,Uda \Updownarrow
