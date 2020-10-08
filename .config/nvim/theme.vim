let g:one_allow_italics = 1
colorscheme one

" Transparent background in terminal
if (!has("gui_running"))
  hi! Normal ctermbg=NONE guibg=NONE
  hi! NonText ctermbg=NONE guibg=NONE
endif
