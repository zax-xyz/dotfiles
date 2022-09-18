local M = {}

M.ft_autocmd = function(filetype, callback)
    vim.api.nvim_create_autocmd('FileType', {
        pattern = filetype,
        callback = callback,
    })
end

M.bind = function(op, lhs, rhs, opts)
    opts = vim.tbl_extend("force", {noremap = true}, opts or {})
    vim.keymap.set(op, lhs, rhs, opts)
end

return M
