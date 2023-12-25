require("auto-session").setup {
    log_level = "error",
    auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
}

local bind = require("utils").bind

for _, lhs in ipairs({"<leader>as", "<C-s>"}) do
    bind("n", lhs, require("auto-session.session-lens").search_session, "Search sessions")
end
