local bind = require('utils').bind

bind("n", "<leader>gr", vim.cmd.OpenInGHRepo, "Open repo in GitHub")
bind("n", "<leader>gf", vim.cmd.OpenInGHFile, "Open file in GitHub")
bind("v", "<leader>gf", ":OpenInGHFileLines<CR>", "Open files in GitHub")
