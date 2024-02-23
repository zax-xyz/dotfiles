local gs = require("gitsigns")
gs.setup {
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        delay = 100,
    },
}

local wk = require("which-key")

wk.register(
    {
        ["]c"] = {
            function()
                if vim.wo.diff then
                    return ']c'
                end
                vim.schedule(function()
                    gs.next_hunk()
                end)
                return '<Ignore>'
            end,
            "Jump to next hunk",
        },
        ["[c"] = {
            function()
                if vim.wo.diff then
                    return '[c'
                end
                vim.schedule(function()
                    gs.prev_hunk()
                end)
                return '<Ignore>'
            end,
            "Jump to previous hunk",
        },
    },
    {
        mode = { "n", "v" }
    }
)
