local bind = require('utils').bind
local wk = require("which-key")

wk.register({
    ["<leader>G"] = {
        name = "Open in Github",
        ["r"] = { vim.cmd.OpenInGHRepo, "Open repo in GitHub" },
        ["f"] = { vim.cmd.OpenInGHFile, "Open file in GitHub" },
        ["F"] = { ":OpenInGHFile!<CR>", "Open file in GitHub commit" },
        ["l"] = { ":OpenInGHFileLines<CR>", "Open lines in GitHub", mode = { "n", "v" } },
        ["L"] = { ":OpenInGHFileLines!<CR>", "Open lines in GitHub commit", mode = { "n", "v" } },
    }
})
