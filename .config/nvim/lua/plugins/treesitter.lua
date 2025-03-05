local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.kitty = {
    install_info = {
        url = "https://github.com/clo4/tree-sitter-kitty-conf",
        files = { "src/parser.c" },
        branch = "main",
        requires_generate_from_grammar = false,
    },
}

require 'nvim-treesitter.configs'.setup {
    -- Modules and its options go here
    auto_install = true,
    highlight = { enable = true },
    incremental_selection = { enable = true },
    indent = {
        enable = true,
        disable = { "python", "html" }
    },
    textobjects = { enable = true },
    matchup = { enable = true },
}
