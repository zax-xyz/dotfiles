local M = {}

--- @param op string | table
--- @param lhs string
--- @param rhs string | function
--- @param opts table | nil
M.bind = function(op, lhs, rhs, opts)
    opts = vim.tbl_extend("force", {noremap = true}, opts or {})
    vim.keymap.set(op, lhs, rhs, opts)
end

--- @param filetype string
--- @param callback function
M.ft_autocmd = function(filetype, callback)
    vim.api.nvim_create_autocmd('FileType', {
        pattern = filetype,
        callback = callback,
    })
end

--- A higher order function that returns a function calling a vim command. Mostly useful for one-line binds:
---
--- ```lua
---     bind("n", "<mapping>", vim_cmd("command"))
--- ```
---
--- @param cmd string
--- @return function
M.vim_cmd = function(cmd)
    return function()
        vim.cmd(cmd)
    end
end

return M
