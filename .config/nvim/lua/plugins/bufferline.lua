local bind = require("utils").bind

require('bufferline').setup({
    options = {
        diagnostics = "coc"
    },
})

bind("n", "<C-n>", vim.cmd.BufferLineCycleNext, "Next buffer")
bind("n", "<C-p>", vim.cmd.BufferLineCyclePrev, "Previous buffer")

bind("n", "<C-S-n>", vim.cmd.BufferLineMoveNext, "Move buffer forward")
bind("n", "<C-S-p>", vim.cmd.BufferLineMovePrev, "Move buffer backwards")

bind("n", "<leader>Be", vim.cmd.BufferLineSortByExtension, "Sort buffers by extension")
bind("n", "<leader>Bd", vim.cmd.BufferLineSortByDirectory, "Sort buffers by directory")
