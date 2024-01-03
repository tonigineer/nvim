return {
    -- Mason
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        cmd = "Mason",
        event = "BufReadPre",

        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                    width = 0.5,
                    height = 0.5
                },
                log_level = vim.log.levels.INFO,
                max_concurrent_installers = 10,
            })

            require("mason-lspconfig").setup {
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "clangd",
                    "rust_analyzer",
                    "bashls",
                    "jsonls",
                    "marksman"
                },
                automatic_installation = true,
            }
        end
    },

    -- LSP Config
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",

        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            -- local on_attach = function(client, bufnr)
            -- end

            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            -- vim.keymap.set('n', '<space>d', vim.diagnostic.open_float)
            -- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            -- vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, {})
            -- vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, {})
            -- vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, {})

            -- Lua
            lspconfig["lua_ls"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = { -- custom settings for lua
                    Lua = {
                        -- make the language server recognize "vim" global
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            -- make language server aware of runtime files
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                        },
                    },
                },
            })

            -- Python
            lspconfig["pyright"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- Rust
            lspconfig.rust_analyzer.setup {
                -- Server-specific settings. See `:help lspconfig-setup`
                settings = {
                    ['rust-analyzer'] = {},
                },
            }
        end
    }
}
