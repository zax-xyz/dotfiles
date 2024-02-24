vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
    -- transparent_background = vim.fn.exists('g:neovide') == 0,
    term_colors = true,
    kitty = false,
})

vim.cmd [[colorscheme catppuccin]]
