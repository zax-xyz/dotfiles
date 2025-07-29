local trouble = require("trouble")

trouble.setup({
    focus = true,
    preview = {
        type = "split",
        relative = "win",
        position = "right",
        size = 0.5,
    },
})

local wk = require("which-key")
wk.register({
    ["<leader>q"] = { function() trouble.toggle("quickfix") end, "Trouble quickfix" }
})

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  callback = function()
    vim.cmd([[Trouble qflist open]])
  end,
})
