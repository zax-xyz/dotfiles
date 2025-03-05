require("neodev").setup()

local vim_cmd = require("utils").vim_cmd

require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = true,
})

vim.opt.updatetime = 300

local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local bind = require('utils').bind
local lsp = vim.lsp

lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
    lsp.diagnostic.on_publish_diagnostics, {
        -- virtual_text = {
        --     format = function(diagnostic)
        --         return string.format("%s: %s", diagnostic.source, diagnostic.message)
        --     end
        -- },
        update_in_insert = true,
    }
)

local border = { border = "rounded", focusable = false, scope = "line" }
vim.diagnostic.config({ float = border })

lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, border)
lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, border)

require('lspsaga').setup({
    ui = {
        border = "rounded",
    },
    code_action = {
        show_server_name = true,
        keys = {
            quit = '<Esc>',
        },
    },
    lightbulb = {
        sign = false,
    },
})

bind("n", "gd", vim_cmd("Lspsaga goto_definition"), "Go to definition")
bind("n", "<C-LeftMouse>", "<LeftMouse>:Lspsaga goto_definition<CR>", "Go to definition")
bind("n", "gy", vim_cmd("Lspsaga goto_type_definition"), "Go to type definition")
bind("n", "gr", vim_cmd("Lspsaga finder"), "Go to references")
bind("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
bind("n", "gi", vim_cmd("Lspsaga finder imp"), "Go to implementations")

bind("n", "<leader>pd", vim_cmd("Lspsaga peek_definition"), "Peek definition")
bind("n", "<leader>py", vim_cmd("Lspsaga peek_type_definition"), "Peek type definition")

bind("n", "<leader>rn", vim_cmd("Lspsaga rename"), "Rename")

bind({"n", "v"}, "[g", vim_cmd("Lspsaga diagnostic_jump_prev"), "Jump to previous diagnostic")
bind({"n", "v"}, "]g", vim_cmd("Lspsaga diagnostic_jump_next"), "Jump to next diagnostic")
bind({"n", "v"}, "<Left>", vim_cmd("Lspsaga diagnostic_jump_prev"), "Jump to previous diagnostic")
bind({"n", "v"}, "<Right>", vim_cmd("Lspsaga diagnostic_jump_next"), "Jump to next diagnostic")

bind("n", "K", vim_cmd("Lspsaga hover_doc"), "Hover under cursor")
bind("n", "<leader>ac", vim_cmd("Lspsaga code_action"), "Code actions")

-- bind({"n", "t"}, "<C-\\>", vim_cmd("Lspsaga term_toggle"), "Toggle popup terminal")

--- @param bufnr number
--- @param enabled boolean | nil
local function set_inlay_hints(bufnr, enabled)
    if enabled == nil then
        enabled = false
    end
    local vim_set_inlay_hints = vim.lsp.inlay_hint
    if vim_set_inlay_hints == nil then
        return
    end
    if type(vim_set_inlay_hints) == "table" then
        vim_set_inlay_hints = vim_set_inlay_hints.enable
    end
    vim_set_inlay_hints(enabled)
end

vim.api.nvim_create_user_command('ToggleInlayHints', function()
    vim.b.inlayHints = vim.b.inlayHints ~= nil and not vim.b.inlayHints
    print("Inlay hints", vim.b.inlayHints and "enabled" or "disabled")
    set_inlay_hints(0, vim.b.inlayHints)
end, {})

bind("n", "<leader>i", vim_cmd("ToggleInlayHints"), "Toggle inlay hints")

local lspHoverGroup = vim.api.nvim_create_augroup("lspHover", { clear = false })

local function config(_config)
    local merged_config = vim.tbl_deep_extend("force", {
        capabilities,
        single_file_support = true,
    }, _config or {})
    merged_config.on_attach = function(client, bufnr)
        vim.api.nvim_clear_autocmds({ group = lspHoverGroup, buffer = bufnr })
        -- vim.api.nvim_create_autocmd('CursorHold', {
        --     group = lspHoverGroup,
        --     pattern = '*',
        --     callback = vim.diagnostic.open_float,
        -- })
        -- vim.api.nvim_create_autocmd('CursorHoldI', {
        --     group = lspHoverGroup,
        --     pattern = '*',
        --     command = "silent! lua vim.lsp.buf.signature_help()",
        -- })

        if client.server_capabilities.inlayHintProvider then
            set_inlay_hints(bufnr, vim.b.inlayHints)
        end

        if _config ~= nil and _config.on_attach ~= nil then
            _config.on_attach(client, bufnr)
        end
    end

    return merged_config
end

lspconfig.lua_ls.setup(config({
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
            client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using
                        -- (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT'
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                            -- Depending on the usage, you might want to add additional paths here.
                            -- E.g.: For using `vim.*` functions, add vim.env.VIMRUNTIME/lua.
                            require("neodev.config").types(),
                            "${3rd}/luv/library",
                            "${3rd}/busted/library",
                        }
                        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                        -- library = vim.api.nvim_get_runtime_file("", true)
                    },
                    hint = { enable = true },
                },
            })
        end
        return true
    end,
}))

local tsserver_settings = {
    inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = false,
        includeInlayVariableTypeHints = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
    }
}

lspconfig.tsserver.setup(config({
    settings = {
        typescript = tsserver_settings,
        javascript = tsserver_settings,
    },
}))
lspconfig.tailwindcss.setup(config({
    settings = {
        tailwindCSS = {
            experimental = {
                classRegex = {
                    "tw`([^`]*)",
                    "tw=\"([^\"]*)",
                    "tw={\"([^\"}]*)",
                    "tw\\.\\w+`([^`]*)",
                    "tw\\(.*?\\)`([^`]*)",
                    { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                    { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                },
            },
            includeLanguages = {
                typescript = "javascript",
                typescriptreact = "javascript",
            },
        }
    },
}))
lspconfig.svelte.setup(config())
lspconfig.eslint.setup {}
lspconfig.html.setup(config())
-- vim.cmd[[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js silent! EslintFixAll]]

lspconfig.texlab.setup(config())
lspconfig.cssls.setup(config())
lspconfig.cssmodules_ls.setup(config())
-- lspconfig.emmet_ls.setup(config())
lspconfig.emmet_language_server.setup(config())

lspconfig.bashls.setup(config())
lspconfig.clangd.setup(config())
lspconfig.pyright.setup(config())
lspconfig.rust_analyzer.setup(config())
lspconfig.gopls.setup(config({
    cmd = { "/Users/mvo/go/bin/gopls" },
}))
lspconfig.sqlls.setup(config())

lspconfig.jsonls.setup(config())

local HOME = os.getenv('HOME')
lspconfig.jdtls.setup(config({
    cmd = {
        -- 💀
        HOME .. '/.local/share/nvim/mason/bin/jdtls',
        '-configuration', HOME .. '/.cache/jdtls/config',
        '-data', HOME .. '/.cache/jdtls/workspace'
    },
    init_options = {
        workspace = HOME .. "/.cache/jdtls/workspace",
    },
}))

lspconfig.kotlin_language_server.setup(config())

-- lspconfig.sourcekit.setup(config())

lspconfig.texlab.setup(config())

local cmp = require 'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
    }),
    formatting = {
        fields = { "kind", "abbr", "menu" },
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

local lspkind = require('lspkind')
cmp.setup {
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol"
        })
    }
}

local formatOnSave = true
vim.api.nvim_create_user_command('ToggleFormatOnSave', function()
    formatOnSave = not formatOnSave
    print("Format on save", formatOnSave and "enabled" or "disabled")
end, {})

vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format() end, {})

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- null_ls.builtins.code_actions.eslint_d,
        -- null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.buf,
        -- null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.prettierd,
        -- null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.gofmt,
        -- null_ls.builtins.formatting.lua_format,
        null_ls.builtins.formatting.black,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            local augroup = vim.api.nvim_create_augroup("formatOnSave", { clear = false })
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    if formatOnSave then
                        vim.lsp.buf.format({ bufnr, timeout_ms = 5000 })
                    end
                end,
            })
        end
    end,
})
require("mason-null-ls").setup({
    automatic_installation = true,
})
