local bind = require('utils').bind
local vim_cmd = require('utils').vim_cmd

local function ftAutocmd(filetype, callback)
    vim.api.nvim_create_autocmd('FileType', {
        pattern = filetype,
        callback = callback,
    })
end

ftAutocmd('python', vim_cmd('hi link pythonNone Structure'))

-- Indentation
ftAutocmd('html,css,javascript,typescript,javascriptreact,typescriptreact,rasi', function()
    local options = { 'tabstop', 'softtabstop', 'shiftwidth' }
    for i = 1, #options do
        vim.opt_local[options[i]] = 2
    end
end)
ftAutocmd('go', function()
    vim.opt_local.expandtab = false
end)

ftAutocmd('plaintex', function()
    vim.opt_local.filetype = 'tex'
end)
ftAutocmd('rmd', function()
    vim.opt_local.filetype = 'markdown'
end)
ftAutocmd('r', function()
    bind('i', '<A-->', '<-', 'R variable assignment', { buffer = true })
end)
ftAutocmd('arduino', function()
    vim.opt_local.filetype = 'cpp'
    vim.opt_local.syntax = 'arduino'
end)

ftAutocmd('tex,markdown,nroff', function()
    vim.opt_local.spell = true
end)

vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
    pattern = '*.yml.phx',
    callback = function()
        vim.opt_local.filetype = 'yaml'
    end
})
