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
