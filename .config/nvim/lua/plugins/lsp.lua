require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = true,
})

-- local ih = require("inlay-hints")
-- ih.setup()

local lspconfig = require("lspconfig")
local lsp = vim.lsp

lspconfig.sumneko_lua.setup {
    settings = {
        Lua = {
            runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
            hint = {
                enable = true,
            }
        }
    }
}

local tsserver_settings = {
    inlayHints = {
        -- includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
    }
}

lspconfig.tsserver.setup {
    settings = {
        typescript = tsserver_settings,
        javascript = tsserver_settings,
    }
}
lspconfig.tailwindcss.setup {
    settings = {
        tailwindCSS = {
            experimental = {
                classRegex = {
                    "tw`([^`]*)",
                    "tw=\"([^\"]*)",
                    "tw={\"([^\"}]*)",
                    "tw\\.\\w+`([^`]*)",
                    "tw\\(.*?\\)`([^`]*)",
                },
            },
            includeLanguages = {
                typescript = "javascript",
                typescriptreact = "javascript",
            },
        }
    },
}
-- lspconfig.eslint.setup {}
-- vim.cmd[[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll]]
lspconfig.html.setup {}
lspconfig.cssls.setup {}
lspconfig.cssmodules_ls.setup {}

lspconfig.bashls.setup {}
lspconfig.clangd.setup {}
lspconfig.pyright.setup {}
lspconfig.rust_analyzer.setup {}
lspconfig.sqlls.setup {}

lspconfig.jsonls.setup {}

local cmp = require'cmp'

cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
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

-- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--     capabilities = capabilities
-- }

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.eslint_d,
    },
})
require("mason-null-ls").setup({
    automatic_installation = true,
})

-- require("lsp-inlayhints").setup()
require("inlay-hints").setup()
vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = lsp.get_client_by_id(args.data.client_id)
    require("inlay-hints").on_attach(client, bufnr)
  end,
})

local bind = require('util.bind')
bind("n", "K", lsp.buf.hover)
bind("n", "<leader>ac", function()
    vim.cmd("CodeActionMenu")
end)

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = lsp.buf.format,
})

lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
    lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true,
    }
)

local border = { border = "single", focusable = false, scope = "line" }
vim.diagnostic.config({ float = border })

lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, border)
lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, border)
