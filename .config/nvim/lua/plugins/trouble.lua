local trouble = require("trouble")

local wk = require("which-key")
wk.register({
    ["<leader>q"] = { function() trouble.toggle("quickfix") end, "Trouble quickfix" }
})
