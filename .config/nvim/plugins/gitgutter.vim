let bar = '▏'
let g:gitgutter_sign_added = bar
let g:gitgutter_sign_modified = bar
let g:gitgutter_sign_removed = bar
let g:gitgutter_sign_modified_removed = bar .. '|'

let g:gitgutter_highlight_linenrs = 1

highlight link GitGutterAddLineNr GitGutterAdd
highlight link GitGutterChangeLineNr GitGutterChange
highlight link GitGutterDeleteLineNr GitGutterDelete
highlight link GitGutterChangeDeleteLineNr GitGutterChangeDelete
