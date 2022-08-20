require'tabline'.setup {
    -- Defaults configuration options
    enable = true,
}
vim.cmd[[
    set guioptions-=e " Use showtabline in gui vim
    set sessionoptions+=tabpages,globals " store tabpages and globals in session

    " Tab controls
    map <C-n> :TablineBufferNext<CR>
    map <C-p> :TablineBufferPrevious<CR>

    noremap <C-t>n :tabn<CR>
    noremap <C-t>t :tabnew<CR>
    noremap <C-t>p :tabp<CR>

    noremap <C-t><C-n> :tabn<CR>
    noremap <C-t><C-t> :tabnew<CR>
    noremap <C-t><C-p> :tabp<CR>

    noremap <C-[> :tabp<CR>
    noremap <C-]> :tabn<CR>

    noremap <C-t>r :TablineTabRename 
]]

