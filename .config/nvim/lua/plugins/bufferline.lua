local colors = require('catppuccin.palettes.mocha')

local selected_hl = {
    bg = colors.surface0,
}

require('bufferline').setup({
    options = {
        diagnostics = "coc"
    },
    highlights = {
        fill = vim.fn.exists('g:neovide') == 1 and {
            bg = colors.bg0,
        } or nil,
        -- fill = { bg = colors.bg0 },
        buffer_selected = selected_hl,
        close_button_selected = selected_hl,
        numbers_selected = selected_hl,
        diagnostic_selected = selected_hl,
        hint_selected = selected_hl,
        hint_diagnostic_selected = selected_hl,
        info_selected = selected_hl,
        info_diagnostic_selected = selected_hl,
        warning_selected = selected_hl,
        warning_diagnostic_selected = selected_hl,
        error_selected = selected_hl,
        error_diagnostic_selected = selected_hl,
        modified_selected = selected_hl,
        duplicate_selected = selected_hl,
        -- separator = selected_hl,
        indicator_selected = selected_hl,
        pick_selected = selected_hl,
    },
})

vim.cmd([[
" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent><C-n> :BufferLineCycleNext<CR>
nnoremap <silent><C-p> :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent><C-S-n> :BufferLineMoveNext<CR>
nnoremap <silent><C-S-p> :BufferLineMovePrev<CR>

" These commands will sort buffers by directory, language, or a custom criteria
nnoremap <silent><leader>be :BufferLineSortByExtension<CR>
nnoremap <silent><leader>bd :BufferLineSortByDirectory<CR>
" nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>
]])
