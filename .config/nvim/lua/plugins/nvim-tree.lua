local api = require("nvim-tree.api")

require("nvim-tree").setup {
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    git = {
        enable = false,
    },
    on_attach = function(bufnr)
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.del("n", "<C-e>", { buffer = bufnr })
    end
}

local tree = api.tree

-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#workaround-when-using-rmagattiauto-session
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    pattern = 'NvimTree*',
    callback = function()
        local view = require('nvim-tree.view')

        if not view.is_visible() then
            tree.open()
        end
    end,
})

-- Make :bd and :q behave as usual when tree is visible
vim.api.nvim_create_autocmd({'BufEnter', 'QuitPre'}, {
    nested = false,
    callback = function(e)
        -- Nothing to do if tree is not opened
        if not tree.is_visible() then
            return
        end

        -- How many focusable windows do we have? (excluding e.g. incline status window)
        local winCount = 0
        for _,winId in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_get_config(winId).focusable then
                winCount = winCount + 1
            end
        end

        -- We want to quit and only one window besides tree is left
        if e.event == 'QuitPre' and winCount == 2 then
            vim.api.nvim_cmd({cmd = 'qall'}, {})
        end

        -- :bd was probably issued an only tree window is left
        -- Behave as if tree was closed (see `:h :bd`)
        if e.event == 'BufEnter' and winCount == 1 then
            -- Required to avoid "Vim:E444: Cannot close last window"
            vim.defer_fn(function()
                -- close nvim-tree: will go to the last buffer used before closing
                tree.toggle({find_file = true, focus = true})
                -- re-open nivm-tree
                tree.toggle({find_file = true, focus = false})
            end, 10)
        end
    end
})

local function find_directory_and_focus()
    require("fzf-lua").files({
        cmd = "fd --type d",
        actions = {
            ["default"] = function(selected, o)
                local file = require'fzf-lua'.path.entry_to_file(selected[1], o)
                tree.find_file({ buf = file.path, open = true, focus = true })
            end,
        }
    })
end

local wk = require("which-key")
wk.register({ ["<leader>fd"] = { find_directory_and_focus, "Find directory and focus in tree" } })
wk.register({
    ["<leader>t"] = { function() tree.toggle(true) end, "Toggle file tree" },
    ["<leader>T"] = { function() tree.open() end, "Toggle file tree" },
})
