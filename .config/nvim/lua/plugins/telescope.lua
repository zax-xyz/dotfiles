local telescope = require('telescope.builtin')
local wk = require('which-key')

wk.register({
    ["<leader>f"] = {
        name = "Find (Telescope)",
        f = { telescope.find_files, "Files" },
        g = {
            name = "Git",
            g = { telescope.git_files, "Files" },
            c = { telescope.git_commits, "Commits" },
            b = { telescope.git_branches, "Branches" },
            s = { telescope.git_status, "Status" },
        },
        b = { telescope.buffers, "Buffers" },
        l = { telescope.live_grep, "Live grep" },
        o = { telescope.oldfiles, "Oldfiles" },
        k = { telescope.keymaps, "Keymaps" },
        c = {
            name = "Commands",
            c = { telescope.commands, "Commands" },
            h = { telescope.command_history, "Command history" },
        },
        m = { telescope.marks, "Marks" },
        s = { telescope.spell_suggest, "Spelling suggestions" },
        z = { telescope.current_buffer_fuzzy_find, "Fuzzy find" },
    }
})
