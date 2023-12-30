local wk = require("which-key")

require('bufferline').setup({
    options = {
        diagnostics = "coc"
    },
})

wk.register({
    ["<C-n>"] = { vim.cmd.BufferLineCycleNext, "Next buffer" },
    ["<C-p>"] = { vim.cmd.BufferLineCyclePrev, "Previous buffer" },

    ["<C-S-n>"] = { vim.cmd.BufferLineMoveNext, "Move buffer forward" },
    ["<C-S-p>"] = { vim.cmd.BufferLineMovePrev, "Move buffer backwards" },

    ["<leader>B"] = {
        name = "Sort buffers",
        e = { vim.cmd.BufferLineSortByExtension, "Sort buffers by extension" },
        d = { vim.cmd.BufferLineSortByDirectory, "Sort buffers by directory" },
    },

    ["<C-t>"] = {
        name = "tabs",

        t = { vim.cmd.tabnew, "New tab" },
        n = { vim.cmd.tabn, "Next tab" },
        p = { vim.cmd.tabp, "Previous tab" },

        ["<C-t>"] = { vim.cmd.tabnew, "New tab" },
        ["<C-n>"] = { vim.cmd.tabn, "Next tab" },
        ["<C-p>"] = { vim.cmd.tabp, "Previous tab" },
    },
    ["<C-;>"] = { vim.cmd.tabp, "Previous tab" },
    ["<C-'>"] = { vim.cmd.tabn, "Next tab" },
})
