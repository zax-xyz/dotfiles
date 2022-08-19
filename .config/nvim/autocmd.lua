local function ftAutocmd(filetype, opts)
  opts.pattern = filetype
  vim.api.nvim_create_autocmd('FileType', opts)
end

ftAutocmd('python', {command = 'hi link pythonNone Structure'})

-- Indentation
ftAutocmd('python,c,cpp,go,java', {
  callback = function()
    local options = {'tabstop', 'softtabstop', 'shiftwidth'}
    for i = 1, #options do
      vim.opt_local[options[i]] = 4
    end
  end,
})
ftAutocmd('go', {
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

ftAutocmd('plaintex', {
  callback = function()
    vim.opt_local.filetype = 'tex'
  end,
})
ftAutocmd('rmd', {
  callback = function()
    vim.opt_local.filetype = 'markdown'
  end,
})
ftAutocmd('r', {
  callback = function()
    vim.keymap.set('i', '<A-->', '<-', {noremap = true, buffer = true})
  end,
})
ftAutocmd('arduino', {
  callback = function()
    vim.opt_local.filetype = 'cpp'
    vim.opt_local.syntax = 'arduino'
  end,
})

ftAutocmd('tex,markdown,nroff', {
  callback = function()
    vim.opt_local.spell = true
  end,
})

ftAutocmd('c,cpp', {
  command = [[syn match cType "\<[a-zA-Z_][a-zA-Z0-9_]*_[t]\>"]],
})
