require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '·',
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'NvimTree' },
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = {
            { function() return '' end, separator = { left = '' } }
        },
        lualine_b = {
            { 'filename', path = 1, shorting_target = 100, separator = { left = '', right = '' } }
        },
        lualine_c = { 'branch', 'diff', 'diagnostics' },
        lualine_x = { { 'filetype', icon_only = true } },
        lualine_y = { 'progress' },
        lualine_z = {
            { 'location', separator = { right = '' } },
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}
