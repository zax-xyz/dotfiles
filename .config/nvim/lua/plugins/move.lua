require("move").setup()
-- require('move').setup({
--     line = {
--         enable = true, -- Enables line movement
--         indent = true  -- Toggles indentation
--     },
--     block = {
--         enable = true, -- Enables block movement
--         indent = true  -- Toggles indentation
--     },
--     word = {
--         enable = true, -- Enables word movement
--     },
--     char = {
--         enable = true -- Enables char movement
--     }
-- })

local wk = require('which-key')

wk.register({
    ["<C-S-j>"] = { ":MoveLine(1)<CR>", "Move line down" },
    ["<C-S-k>"] = { ":MoveLine(-1)<CR>", "Move line up" },
    -- ["<C-S-l>"] = { ":MoveHChar(1)<CR>", "Move character forwards" },
    -- ["<C-S-h>"] = { ":MoveHChar(-1)<CR>", "Move character backwards" },
    -- ["<C-S-f>"] = { ":MoveWord(1)<CR>", "Move word forwards" },
    -- ["<C-S-b>"] = { ":MoveWord(-1)<CR>", "Move word backwards" },
}, { mode = "n" })

wk.register({
    ["<C-S-j>"] = { ":MoveBlock(1)<CR>", "Move block down" },
    ["<C-S-k>"] = { ":MoveBlock(-1)<CR>", "Move block up" },
    -- ["<C-S-l>"] = { ":MoveHBlock(1)<CR>", "Move block forwards" },
    -- ["<C-S-h>"] = { ":MoveHBlock(-1)<CR>", "Move block backwards" },
}, { mode = "v" })
