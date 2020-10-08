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

