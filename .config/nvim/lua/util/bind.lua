local function bind(op, lhs, rhs, opts)
    opts = vim.tbl_extend("force", {noremap = true}, opts or {})
    vim.keymap.set(op, lhs, rhs, opts)
end

return bind
