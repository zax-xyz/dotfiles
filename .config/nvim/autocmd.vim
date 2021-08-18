" Cursors
" block cursor on enter vim
autocmd VimEnter * silent exec "! echo -ne '\e[1 q'"
" line cursor on leave vim
autocmd VimLeave * silent exec "! echo -ne '\e[5 q'"

au FileType python hi link pythonNone Structure

" Indentation
au FileType python,c,cpp,go,java setlocal tabstop=4 softtabstop=4 shiftwidth=4
au FileType go setlocal noexpandtab

au FileType plaintex setlocal filetype=tex
au FileType rmd setlocal filetype=markdown
" au FileType javascript inoremap <buffer> == ===
" au FileType javascript inoremap <buffer> != !==
au FileType r inoremap <buffer> <A--> <-
au FileType arduino setlocal filetype=cpp syntax=arduino

" Markdown heading colours
autocmd FileType markdown highlight htmlH1 ctermfg=blue

au FileType tex,markdown,nroff setlocal spell

" autocmd BufReadPost * :DetectIndent

au FileType c,cpp syn match cType "\<[a-zA-Z_][a-zA-Z0-9_]*_[t]\>"
