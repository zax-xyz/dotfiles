local bind = require('utils').bind
local wk = require("which-key")

wk.register({
    ["<leader>g"] = {
        name = "Open in Github",
        ["r"] = { vim.cmd.OpenInGHRepo, "Open repo in GitHub" },
        ["f"] = { vim.cmd.OpenInGHFile, "Open file in GitHub" },
        ["l"] = { ":OpenInGHFileLines<CR>", "Open lines in GitHub", mode = { "n", "v" } },
    }
})
