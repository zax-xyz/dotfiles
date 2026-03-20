vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

require("auto-session").setup {
    log_level = "error",
    suppressed_dirs = { "~/", "~/Downloads", "/" },
}


local bind = require("utils").bind
local vim_cmd = require('utils').vim_cmd

for _, lhs in ipairs({"<leader>S"}) do
    bind("n", lhs, vim_cmd("AutoSession search"), "Search sessions")
end
