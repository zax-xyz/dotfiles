local wk = require('which-key')
local fzf = require('fzf-lua')

fzf.setup({ 'telescope' })

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
        b = { fzf.buffers, "Buffers" },
        l = { fzf.live_grep, "Live grep" },
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
        n = { ':TermExec cmd="ns"<CR>', "Find files using sk" },
        r = { fzf.resume, "Resume" },
    },
    ["<leader>g"] = { fzf.git_files, "Git files" },
})
