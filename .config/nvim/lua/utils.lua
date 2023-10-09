local M = {}

---@param op string | table
---@param lhs string
---@param rhs string | function
---@param opts table | nil
M.bind = function(op, lhs, rhs, opts)
    opts = vim.tbl_extend("force", {noremap = true}, opts or {})
    vim.keymap.set(op, lhs, rhs, opts)
end

---@param filetype string
---@param callback function
M.ft_autocmd = function(filetype, callback)
    vim.api.nvim_create_autocmd('FileType', {
        pattern = filetype,
        callback = callback,
    })
end

return M
