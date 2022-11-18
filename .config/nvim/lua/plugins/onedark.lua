local bind = require('util.bind')

require('onedark').setup {
    transparent = vim.fn.exists('g:neovide') == 0,
}
require('onedark').load()

local transparent = true
bind("", "<leader>t", function()
    transparent = not transparent
    require('onedark').setup {
        transparent = transparent
    }
    require('onedark').load()
end)
