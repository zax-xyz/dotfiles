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
    ignore_install = { 'markdown', 'markdown_inline' },
    highlight = {
        enable = true,
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
    },
    incremental_selection = { enable = true },
    indent = {
        enable = true,
        disable = { "python", "html" }
    },
    textobjects = { enable = true },
    matchup = { enable = true },
}
