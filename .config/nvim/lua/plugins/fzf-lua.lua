local wk = require('which-key')
local fzf = require('fzf-lua')

local actions = require("trouble.sources.fzf").actions
fzf.setup({
    { 'telescope', 'hide' },
    actions = {
        files = { ["ctrl-t"] = actions.open },
    },
})

wk.register({
    ["<leader>f"] = {
        name = "Find (Fzf)",
        f = { fzf.files, "Files" },
        g = {
            name = "Git",
            g = { fzf.git_files, "Files" },
            c = { fzf.git_commits, "Commits" },
            b = { fzf.git_branches, "Branches" },
            s = { fzf.git_status, "Status" },
        },
        -- b = { fzf.buffers, "Buffers" },
        l = { fzf.live_grep_native, "Live grep" },
        o = { fzf.oldfiles, "Oldfiles" },
        k = { fzf.keymaps, "Keymaps" },
        c = {
            name = "Commands",
            c = { fzf.commands, "Commands" },
            h = { fzf.command_history, "Command history" },
        },
        m = { fzf.marks, "Marks" },
        s = { fzf.spell_suggest, "Spelling suggestions" },
        z = { fzf.grep_curbuf, "Fuzzy find" },
        n = { ':TermExec cmd="fzf"<CR>', "Find files using fzf" },
        r = { fzf.resume, "Resume" },
        b = { fzf.buffers, "Buffers" },
    },
    ["<leader>g"] = { fzf.git_files, "Git files" },
    ["<leader>F"] = { fzf.files, "Files" },
    ["<leader>b"] = { fzf.buffers, "Buffers" },
})
