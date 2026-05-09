require('color-converter').setup({})

local wk = require("which-key")

wk.register({
    ["<leader>c"] = { require('color-converter').cycle, "Cycle colour formats" },
})
