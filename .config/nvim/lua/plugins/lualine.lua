local map = require("utils").map
local colors = require('catppuccin.palettes.mocha')

local isNeovide = vim.fn.exists('g:neovide') == 1
local left = isNeovide and '' or ''
local right = isNeovide and '' or ''

local function lsp()
    return table.concat(
        map(vim.lsp.get_clients({ bufnr = 0 }), function(client) return client.name end),
        ', '
    )
end

local function left_block() return isNeovide and '▌' or '' end
local function right_block() return isNeovide and '▐' or '' end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '',
        section_separators = { left = right, right = left },
        disabled_filetypes = { 'NvimTree' },
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = {
            { right_block, padding = {}, color = { fg = colors.surface0 } },
        },
        lualine_b = {
            { 'filename', path = 0, shorting_target = 100, separator = { left = left, right = right } },
        },
        lualine_c = {
            { left_block, padding = {}, color = { fg = colors.surface0 }, },
            { 'branch', icon = '', color = { fg = colors.subtext1 }, padding = { left = 2, right = 1 } },
            { 'diff', colored = false,  color = { fg = colors.overlay2 } },
        },
        lualine_x = {
            { 'diagnostics', symbols = { error = ' ', warn = ' ', info = ' ' }, },
            { lsp, icon = '', color = { fg = colors.overlay2 }, padding = { left = 1, right = 2 }, },
        },
        lualine_y = {
            { 'progress', color = { fg = colors.subtext1, bg = colors.mantle } },
            { 'location', separator = { right = '' }, color = { fg = colors.subtext1, bg = colors.mantle } },
        },
        lualine_z = {
            { function() return '▌' end, padding = {}, color = { fg = colors.base }, separator = {} },
        },
    },
    inactive_sections = {
        lualine_a = {
            -- spacing to keep the filename in the same place
            { function() return ' ' end, padding = { left = 0, right = 0 } }
        },
        lualine_b = {},
        lualine_c = { { 'filename', path = 0 } },
        lualine_x = {
            { 'location', padding = { left = 0, right = 2 } }
        },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {}
}
