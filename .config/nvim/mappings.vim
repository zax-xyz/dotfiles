" Autodetect filetype
noremap <leader>rf :filetype detect<CR>

" Split navigation
noremap <C-H> <C-W><C-H>
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>

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

" Easier indent
nnoremap > >>
nnoremap < <<

" Save files as root
cmap w!! w !sudo tee > /dev/null %

" Compile documents
noremap <leader>c :w<CR>:!true \| ~/.scripts/compile "%" &> /dev/null & disown<CR><CR>
imap <C-c> <Esc><leader>c
au FileType markdown nmap <leader>C :w<CR>:!~/.scripts/compile "%" 1000 &> /dev/null & disown<CR><CR>

" Toggle spellcheck
noremap <leader>s :setlocal spell!<CR>

" Fix previous spelling error
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

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

" " Find files with fzf
" noremap <leader>f :Files<CR>
" noremap <leader>g :GFiles<CR>

" noremap <leader>b :Buffers<CR>

noremap <leader>h :nohl<CR>

" set langmap=dg,ek,fe,gt,il,jy,kn,lu,nj,pr,rs,sd,tf,ui,yo,op,DG,EK,FE,GT,IL,JY,KN,LU,NJ,PR,RS,SD,TF,UI,YO,OP

if exists('g:vscode')
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine
endif

noremap <leader>y :%y+<CR>
