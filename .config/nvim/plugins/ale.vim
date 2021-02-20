let g:ale_list_window_size = 3
nnoremap <silent> <leader>J :ALENext<cr>
nnoremap <silent> <leader>K :ALEPrevious<cr>
nnoremap <silent> <right> :ALENext<cr>
nnoremap <silent> <left> :ALEPrevious<cr>
nnoremap <silent> <leader>a :ALEToggle<cr>

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\   'vue': ['prettier'],
\   'java': ['prettier'],
\   'python': ['autopep8'],
\}
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--print-width 120'

au FileType java let g:ale_javascript_prettier_options = '--print-width 100'
