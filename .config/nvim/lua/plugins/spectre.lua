local spectre = require("spectre")
local wk = require('which-key')

wk.add({
    { "n", "<leader>R", spectre.toggle, { desc = "Toggle spectre" } },
    { "n", "<leader>rw", function() spectre.open_visual({ select_word = true }) end, { desc = "Toggle spectre" } },
})
