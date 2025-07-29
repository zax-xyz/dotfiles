local mc = require("multicursor-nvim")

mc.setup()

local bind = require('utils').bind

bind({"n", "v"}, "<up>", function() mc.lineAddCursor(-1) end, "Add cursor above")
bind({"n", "v"}, "<down>", function() mc.lineAddCursor(1) end, "Add cursor below")
bind({"n", "v"}, "<a-k>", function() mc.lineSkipCursor(-1) end, "Skip cursor below")
bind({"n", "v"}, "<a-j>", function() mc.lineSkipCursor(1) end, "Skip cursor above")

-- Add or skip adding a new cursor by matching word/selection
bind({"n", "x"}, "<c-m>", function() mc.matchAddCursor(1) end, "Add next match cursor")
bind({"n", "x"}, "<c-s-m>", function() mc.matchAddCursor(-1) end, "Add previous match cursor")
bind({"n", "x"}, "<c-s>", function() mc.matchSkipCursor(1) end, "Skip next match cursor")
bind({"n", "x"}, "<c-a-s>", function() mc.matchSkipCursor(-1) end, "Skip previous match cursor")

bind("n", "<c-leftmouse>", mc.handleMouse)
bind("n", "<c-leftdrag>", mc.handleMouseDrag)
bind("n", "<c-leftrelease>", mc.handleMouseRelease)

bind({"n", "v"}, "<leader>A", mc.matchAllAddCursors, "Add cursors to all matches")
bind("n", "<leader>a", mc.alignCursors, "Align cursor columns")

-- Delete the main cursor.
bind({"n", "v"}, "<leader>x", mc.deleteCursor, "Delete main cursor")

-- Add and remove cursors with control + left click.
bind("n", "<c-leftmouse>", mc.handleMouse)

-- Easy way to add and remove cursors using the main cursor.
bind({"n", "v"}, "<c-q>", mc.toggleCursor)

bind("n", "<esc>", function()
    if not mc.cursorsEnabled() then
        mc.enableCursors()
    elseif mc.hasCursors() then
        mc.clearCursors()
    else
        -- Default <esc> handler.
    end
end)

-- Append/insert for each line of visual selections.
bind("v", "I", mc.insertVisual)
bind("v", "A", mc.appendVisual)

-- match new cursors within visual selections by regex.
bind("v", "M", mc.matchCursors)

-- Jumplist support
bind({"v", "n"}, "<c-i>", mc.jumpForward)
bind({"v", "n"}, "<c-o>", mc.jumpBackward)

bind("n", "<leader>/A", mc.searchAllAddCursors, "Add cursors to all search results")

bind({"n", "x"}, "<leader>m", mc.operator)

local hl = vim.api.nvim_set_hl
hl(0, "MultiCursorCursor", { link = "Cursor" })
hl(0, "MultiCursorVisual", { link = "Visual" })
hl(0, "MultiCursorSign", { link = "SignColumn"})
hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})
