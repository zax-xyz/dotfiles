-- https://github.com/neovide/neovide/issues/3128
if vim.fn.exists('g:neovide') == 0 then
    require('treesitter-context').setup({
        max_lines = 3,
        min_window_height = 15,
    })
end
