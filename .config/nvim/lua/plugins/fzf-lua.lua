local wk = require('which-key')
local fzf = require('fzf-lua')
local utils = fzf.utils
local actions = fzf.actions

local function hl_validate(hl)
  return not utils.is_hl_cleared(hl) and hl or nil
end

-- fzf.setup({ 'telescope' })

fzf.setup({
    fzf_bin = 'sk',
    fzf_opts = { ["--layout"] = "default", ["--no-separator"] = false },
    winopts    = {
        width   = 0.8,
        height  = 0.9,
        preview = {
            hidden       = "nohidden",
            vertical     = "up:45%",
            horizontal   = "right:50%",
            layout       = "flex",
            flip_columns = 120,
        },
    },
    hls        = {
        normal         = hl_validate "TelescopeNormal",
        border         = hl_validate "TelescopeBorder",
        title          = hl_validate "TelescopeTitle",
        help_normal    = hl_validate "TelescopeNormal",
        help_border    = hl_validate "TelescopeBorder",
        preview_normal = hl_validate "TelescopeNormal",
        preview_border = hl_validate "TelescopeBorder",
        preview_title  = hl_validate "TelescopeTitle",
        -- builtin preview only
        cursor         = hl_validate "Cursor",
        cursorline     = hl_validate "TelescopePreviewLine",
        cursorlinenr   = hl_validate "TelescopePreviewLine",
        search         = hl_validate "IncSearch",
    },
    fzf_colors = {
        ["fg"] = { "fg", "TelescopeNormal" },
        ["bg"] = { "bg", "TelescopeNormal" },
        ["hl"] = { "fg", "TelescopeMatching" },
        ["fg+"] = { "fg", "TelescopeSelection" },
        ["bg+"] = { "bg", "TelescopeSelection" },
        ["hl+"] = { "fg", "TelescopeMatching" },
        ["info"] = { "fg", "TelescopeMultiSelection" },
        ["border"] = { "fg", "TelescopeBorder" },
        ["gutter"] = { "bg", "TelescopeNormal" },
        ["prompt"] = { "fg", "TelescopePromptPrefix" },
        ["pointer"] = { "fg", "TelescopeSelectionCaret" },
        ["marker"] = { "fg", "TelescopeSelectionCaret" },
        ["header"] = { "fg", "TelescopeTitle" },
    },
    keymap     = {
        builtin = {
            ["<F1>"]     = "toggle-help",
            ["<F2>"]     = "toggle-fullscreen",
            -- Only valid with the 'builtin' previewer
            ["<F3>"]     = "toggle-preview-wrap",
            ["<F4>"]     = "toggle-preview",
            ["<F5>"]     = "toggle-preview-ccw",
            ["<F6>"]     = "toggle-preview-cw",
            ["<C-d>"]    = "preview-page-down",
            ["<C-u>"]    = "preview-page-up",
            ["<S-left>"] = "preview-page-reset",
        },
        fzf = {
            ["ctrl-z"] = "abort",
            ["ctrl-f"] = "half-page-down",
            ["ctrl-b"] = "half-page-up",
            ["ctrl-a"] = "beginning-of-line",
            ["ctrl-e"] = "end-of-line",
            ["alt-a"]  = "toggle-all",
            -- Only valid with fzf previewers (bat/cat/git/etc)
            ["f3"]     = "toggle-preview-wrap",
            ["f4"]     = "toggle-preview",
            ["ctrl-d"] = "preview-page-down",
            ["ctrl-u"] = "preview-page-up",
            ["ctrl-q"] = "select-all+accept",
        },
    },
    actions    = {
        files = {
            ["default"] = actions.file_edit_or_qf,
            ["ctrl-x"]  = actions.file_split,
            ["ctrl-v"]  = actions.file_vsplit,
            ["ctrl-t"]  = actions.file_tabedit,
            ["alt-q"]   = actions.file_sel_to_qf,
            ["alt-l"]   = actions.file_sel_to_ll,
        },
        buffers = {
            ["default"] = actions.buf_edit,
            ["ctrl-x"]  = actions.buf_split,
            ["ctrl-v"]  = actions.buf_vsplit,
            ["ctrl-t"]  = actions.buf_tabedit,
        }
    },
    buffers    = {
        keymap = { builtin = { ["<C-d>"] = false } },
        actions = { ["ctrl-x"] = false, ["ctrl-d"] = { actions.buf_del, actions.resume } },
    },
    defaults   = { git_icons = false },
})

wk.register({
    ["<leader>f"] = {
        name = "Find (Fzf)",
        f = { fzf.files, "Files" },
        g = {
            name = "Git",
            g = { fzf.git_files, "Files" },
            c = { fzf.git_commits, "Commits" },
            b = { fzf.git_branches, "Branches" },
            s = { fzf.git_status, "Status" },
        },
        -- b = { fzf.buffers, "Buffers" },
        l = { fzf.live_grep_native, "Live grep" },
        o = { fzf.oldfiles, "Oldfiles" },
        k = { fzf.keymaps, "Keymaps" },
        c = {
            name = "Commands",
            c = { fzf.commands, "Commands" },
            h = { fzf.command_history, "Command history" },
        },
        m = { fzf.marks, "Marks" },
        s = { fzf.spell_suggest, "Spelling suggestions" },
        z = { fzf.grep_curbuf, "Fuzzy find" },
        n = { ':TermExec cmd="ns"<CR>', "Find files using sk" },
        r = { fzf.resume, "Resume" },
    },
    ["<leader>g"] = { fzf.git_files, "Git files" },
    ["<leader>F"] = { fzf.files, "Files" },
    -- ["<leader>b"] = { fzf.buffers, "Buffers" },
})
