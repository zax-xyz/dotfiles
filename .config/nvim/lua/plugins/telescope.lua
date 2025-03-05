local telescope = require('telescope.builtin')
local trouble = require("trouble")
local wk = require('which-key')

require('telescope').setup({
    defaults = {
        mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
        }
    },
    pickers = {
        buffers = {
            -- sort_lastused = true,
            sort_mru = true,
            ignore_current_buffer = true,
            mappings = {
                i = { ["<c-d>"] = "delete_buffer" },
            },
        },
    },
})

require('telescope').load_extension('fzf')

-- wk.register({
--     ["<leader>f"] = {
--         name = "Find (Telescope)",
--         f = { telescope.find_files, "Files" },
--         g = {
--             name = "Git",
--             g = { telescope.git_files, "Files" },
--             c = { telescope.git_commits, "Commits" },
--             b = { telescope.git_branches, "Branches" },
--             s = { telescope.git_status, "Status" },
--         },
--         b = { telescope.buffers, "Buffers" },
--         l = { telescope.live_grep_native, "Live grep" },
--         o = { telescope.oldfiles, "Oldfiles" },
--         k = { telescope.keymaps, "Keymaps" },
--         c = {
--             name = "Commands",
--             c = { telescope.commands, "Commands" },
--             h = { telescope.command_history, "Command history" },
--         },
--         m = { telescope.marks, "Marks" },
--         s = { telescope.spell_suggest, "Spelling suggestions" },
--         z = { telescope.current_buffer_fuzzy_find, "Fuzzy find" },
--         n = { ':TermExec cmd="ns"<CR>', "Find files using sk" }
--     }
-- })

wk.register({
    ["<leader>fb"] = { function() telescope.buffers() end, "Buffers" },
    ["<leader>b"] = { function() telescope.buffers() end, "Buffers" },
})
