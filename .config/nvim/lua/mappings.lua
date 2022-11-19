local bind = require('util.bind')
local ft_autocmd = require('util.ft_autocmd')
local F = require('f-strings.F')

bind("n", "<leader>rf", ':filetype detect')

-- split navigation
local dirs = {"H", "J", "K", "L"}
---@diagnostic disable-next-line: unused-local diagnostics fucky with f-string lib :(
for _, dir in ipairs(dirs) do
    bind("n", F"<C-{dir}>", F"<C-W><C-{dir}>")
end

-- visual line navigation
local arrow_dirs = {Up = "k", Down = "j"}
---@diagnostic disable-next-line: unused-local
for key, val in pairs(arrow_dirs) do
    local lhs = F"<{key}>"
    bind("", lhs, "g" .. val)
    bind("i", lhs, F"<Esc>g{val}a")
end

bind("", "<leader><leader>", "/<++><CR>c4l")
bind("", "<leader><Tab>", "/<++><CR>")

local replace_cmd = "s//g<Left><Left>"
bind("", "<leader>s", ":" .. replace_cmd)
bind("", "<leader>S", ":%" .. replace_cmd)

bind("", "<leader>n", ":norm")

local indent_keys = {">", "<"}
for _, key in ipairs(indent_keys) do
    bind("n", key, key .. key)
end

bind("c", "w!!", "w !sudo tee > /dev/null %")

---@diagnostic disable-next-line: unused-local
local write_cmd = ":w<CR>"
---@diagnostic disable-next-line: unused-local
local compile_cmd = '~/.scripts/compile "%"'
---@diagnostic disable-next-line: unused-local
local compile_fin = " &> /dev/null & disown<CR><CR>"
bind("n", "<leader>c", F"{write_cmd}:!true | {compile_cmd} {compile_fin}")
ft_autocmd("markdown", function()
    bind("n", "<leader>C", F"{write_cmd}:!{compile_cmd} 1000 {compile_fin}")
end)

bind("", "<leader>s", ":setlocal spell!<CR>")

bind("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u")

local wrap_mappings = {"k", "j", "<Home>", "<End>"}
local wrap_imappings = {
    ["<Up>"] = "<C-o>gk",
    ["<Down>"] = "<C-o>gj",
    ["<Home>"] = "<C-o>g<Home>",
    ["<End>"] = "<C-o>g<End>",
}

local function toggle_wrap()
    vim.opt_local.linebreak = not vim.opt_local.linebreak
    if vim.opt_local.linebreak then
        for _, lhs in ipairs(wrap_mappings) do
            bind("", lhs, "g" .. lhs, {buffer = true, silent = true})
        end
        for lhs, rhs in pairs(wrap_imappings) do
            bind("i", lhs, rhs, {buffer = true, silent = true})
        end
    else
        for _, lhs in ipairs(wrap_mappings) do
            vim.keymap.del("", lhs, {buffer = true})
        end
        for lhs, _ in pairs(wrap_imappings) do
            vim.keymap.del("i", lhs, {buffer = true})
        end
    end
end

bind("", "<leader>w", toggle_wrap)

bind("", "<leader>h", ":nohl<CR>")

if not vim.fn.exists('g:vscode') then
    bind({"x", "n", "o"}, "gc", "<Plug>VSCodeCommentary")
    bind("n", "gcc", "<Plug>VSCodeCommentaryLine")
end

-- copy to system clipboard
bind("", "<leader>y", '"+y')
bind("", "<leader>Y", ':%y+<CR>')

bind("", "<leader>ac", function() vim.lsp.buf.code_action({range = {start = {0, 0}, ["end"] = {-1, -1}}}) end)
bind("n", "gd", vim.lsp.buf.definition)
bind("n", "gy", vim.lsp.buf.type_definition)

local nvim_tree = require("nvim-tree.api")
bind("n", "<leader>t", function() nvim_tree.tree.toggle(true) end)
