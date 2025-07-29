require("catppuccin").setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    -- transparent_background = vim.fn.exists('g:neovide') == 0,
    term_colors = true,
    kitty = false,
    integrations = {
        fidget = true,
        mason = true,
        telescope = {
            enabled = true,
            style = "nvchad",
        }
    },
})

vim.cmd [[colorscheme catppuccin]]
