vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
    transparent_background = vim.fn.exists('g:neovide') == 0,
})

vim.cmd [[colorscheme catppuccin]]
