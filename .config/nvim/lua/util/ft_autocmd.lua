local function ft_autocmd (filetype, callback)
    vim.api.nvim_create_autocmd('FileType', {
        pattern = filetype,
        callback = callback,
    })
end

return ft_autocmd
