require("multicursors").setup({})

local wk = require('which-key')
wk.register({
    ["<leader>m"] = { function() vim.cmd("MCstart") end, "Create a selection for selected text or word under the cursor" }
}, { mode = { "v", "n" } })
