local colors = require('catppuccin.palettes.mocha')
local bind = require("utils").bind

local selected_hl = {
    bg = colors.surface0,
}

require('bufferline').setup({
    options = {
        diagnostics = "coc"
    },
    highlights = {
        -- buffer_selected = selected_hl,
        -- close_button_selected = selected_hl,
        -- numbers_selected = selected_hl,
        -- diagnostic_selected = selected_hl,
        -- hint_selected = selected_hl,
        -- hint_diagnostic_selected = selected_hl,
        -- info_selected = selected_hl,
        -- info_diagnostic_selected = selected_hl,
        -- warning_selected = selected_hl,
        -- warning_diagnostic_selected = selected_hl,
        -- error_selected = selected_hl,
        -- error_diagnostic_selected = selected_hl,
        -- modified_selected = selected_hl,
        -- duplicate_selected = selected_hl,
        -- -- separator = selected_hl,
        -- indicator_selected = selected_hl,
        -- pick_selected = selected_hl,
    },
})

bind("n", "<C-n>", vim.cmd.BufferLineCycleNext, "Next buffer")
bind("n", "<C-p>", vim.cmd.BufferLineCyclePrev, "Previous buffer")

bind("n", "<C-S-n>", vim.cmd.BufferLineMoveNext, "Move buffer forward")
bind("n", "<C-S-p>", vim.cmd.BufferLineMovePrev, "Move buffer backwards")

bind("n", "<leader>Be", vim.cmd.BufferLineSortByExtension, "Sort buffers by extension")
bind("n", "<leader>Bd", vim.cmd.BufferLineSortByDirectory, "Sort buffers by directory")
