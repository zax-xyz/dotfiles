local bind = require('utils').bind
local ft_autocmd = require('utils').ft_autocmd
local vim_cmd = require('utils').vim_cmd
local F = require('f-strings.F')

bind("n", "<leader>rf", vim_cmd('filetype detect'), 'Detect filetype')

-- split navigation
local dirs = {"H", "J", "K", "L"}
---@diagnostic disable-next-line: unused-local diagnostics fucky with f-string lib :(
local human_dirs = {"left", "down", "up", "right"}
---@diagnostic disable-next-line: unused-local diagnostics fucky with f-string lib :(
for i, dir in ipairs(dirs) do
    bind("n", F"<C-{dir}>", F"<C-W><C-{dir}>", F"Switch to {human_dirs[i]} pane")
end

-- -- visual line navigation
-- local arrow_dirs = {Up = "k", Down = "j"}
-- ---@diagnostic disable-next-line: unused-local
-- for key, val in pairs(arrow_dirs) do
--     local lhs = F"<{key}>"
--     bind("", lhs, "g" .. val, F"{key} visual line")
--     bind("i", lhs, F"<Esc>g{val}a", F"{key} visual line")
-- end

bind("", "<leader><leader>", "/<++><CR>c4l", "replace next <++>")
bind("", "<leader><Tab>", "/<++><CR>", "find next <++>")

local replace_cmd = "s//g<Left><Left>"
bind("", "<leader>s", ":" .. replace_cmd, ":s command template")
bind("", "<leader>S", ":%" .. replace_cmd, ":%s command tempalte")

bind("", "<leader>n", ":norm ")

-- local indent_keys = {">", "<"}
-- local indent_desc = {"Indent line", "Unindent line"}
-- for i, key in ipairs(indent_keys) do
--     bind("n", key, key .. key, indent_desc[i])
-- end

bind("c", "w!!", "w !sudo tee > /dev/null %", "Write file as root")

---@diagnostic disable-next-line: unused-local
local write_cmd = ":w<CR>"
---@diagnostic disable-next-line: unused-local
local compile_cmd = '~/.scripts/compile "%"'
---@diagnostic disable-next-line: unused-local
local compile_fin = " &> /dev/null & disown<CR><CR>"
bind("n", "<leader>c", F"{write_cmd}:!true | {compile_cmd} {compile_fin}", "Compile file")
ft_autocmd("markdown", function()
    bind("n", "<leader>C", F"{write_cmd}:!{compile_cmd} 1000 {compile_fin}", "Compile file with delay")
end)

bind("", "<leader>s", vim_cmd("setlocal spell!"), "Toggle spellcheck")

bind("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", "Fix previous spelling error")

local wrap_mappings = {"k", "j", "<Home>", "<End>"}
local wrap_imappings = {
    ["<Up>"] = "<C-o>gk",
    ["<Down>"] = "<C-o>gj",
    ["<Home>"] = "<C-o>g<Home>",
    ["<End>"] = "<C-o>g<End>",
}

local function toggle_wrap()
    vim.opt_local.linebreak = not vim.opt_local.linebreak:get()
    if vim.opt_local.linebreak then
        for _, lhs in ipairs(wrap_mappings) do
            bind("", lhs, "g" .. lhs, F"{lhs} with wrapping", {buffer = true, silent = true})
        end
        for lhs, rhs in pairs(wrap_imappings) do
            bind("i", lhs, rhs, F"{lhs} with wrapping", {buffer = true, silent = true})
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

bind("", "<leader>w", toggle_wrap, "Toggle word wrap")

bind("", "<leader>h", vim_cmd("nohl"), "Clear search highlights")

if not vim.fn.exists('g:vscode') then
    bind({"x", "n", "o"}, "gc", "<Plug>VSCodeCommentary", "Comment lines")
    bind("n", "gcc", "<Plug>VSCodeCommentaryLine", "Comment line")
end

-- copy to system clipboard
bind("", "<leader>y", '"+y', "Copy to system clipboard")
bind("", "<leader>Y", vim_cmd('%y+'), "Copy file to system clipboard")
bind("", "<leader>p", '"+p', "Paste from system clipboard")
bind("", "<leader>P", '"+P', "Paste above from system clipboard")

bind("t", "<S-Space>", "<Space>")
bind("n", "<leader>o", vim_cmd(":!xdg-open %"), "Open file in system default")

-- bind("n", "<leader>G", vim.cmd.Git, "Git")

local bufdelete = require('bufdelete')
bind("n", "<A-w>", function() bufdelete.bufdelete() end, "Delete buffer")

---@param s string
---@param substr string
string.endswith = function(s, substr)
    return s:sub(-#substr) == substr
end

---@param s string
---@param replacements table
local function replace_ext(s, replacements)
    for old, new in pairs(replacements) do
        if s:endswith(old) then
            return s:sub(1, -#old - 1) .. new
        end
    end
end

bind("n", "<leader>H", function()
    vim.cmd("e " .. replace_ext(vim.api.nvim_buf_get_name(0), { hpp = "cpp", cpp = "hpp", c = "h", h = "c" }))
end, "Toggle C/C++ source/header")

bind("", "<C-8>", vim_cmd(':keepjumps normal! mi*`i'))

bind("n", "gp", "`[v`]", "Select pasted text")
bind("n", "gP", "`[V`]", "Select pasted lines")
