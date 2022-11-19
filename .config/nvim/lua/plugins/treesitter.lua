require'nvim-treesitter.configs'.setup {
    -- Modules and its options go here
    highlight = { enable = true },
    incremental_selection = { enable = true },
    indent = {
        enable = true,
        disable = {"python"}
    },
    textobjects = { enable = true },
    matchup = { enable = true },
}

require("nvim-tree").setup()
