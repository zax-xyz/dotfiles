require("nvim-tree").setup {
    update_focused_file = {
        enable = true,
        update_root = true,
    },
}

-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#workaround-when-using-rmagattiauto-session
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = 'NvimTree*',
  callback = function()
    local api = require('nvim-tree.api')

    if not api.tree.is_visible() then
      api.tree.open()
    end
  end,
})

local bind = require('utils').bind

local nvim_tree = require("nvim-tree.api")
bind("n", "<leader>t", function() nvim_tree.tree.toggle(true) end)
