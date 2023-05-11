require 'nvim-treesitter.configs'.setup {
    -- Modules and its options go here
    highlight = { enable = true },
    incremental_selection = { enable = true },
    indent = {
        enable = true,
        disable = { "python", "html" }
    },
    textobjects = { enable = true },
    matchup = { enable = true },
}
