return {
    "williamboman/mason-lspconfig.nvim",
    event = "BufReadPre",
    dependencies = {
        {
            { "neovim/nvim-lspconfig",
                "simrat39/rust-tools.nvim",
                "Saecki/crates.nvim",
                "p00f/clangd_extensions.nvim",
                "nvimdev/lspsaga.nvim"
            }
        },
    },

    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
            opts.buffer = bufnr
        end
        local capabilities = cmp_nvim_lsp.default_capabilities()

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

        -- C/C++
        local capabilities_edit = capabilities
        capabilities_edit.offsetEncoding = { "utf-16" }
        lspconfig["clangd"].setup({
            capabilities = capabilities_edit,
            on_attach = on_attach,
        })

        -- Rust
        local rt = require("rust-tools")
        rt.setup({
            server = {
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
                -- on_attach = function(_, bufnr)
                --     vim.keymap.set("n", "<Leader>r", rt.hover_actions.hover_actions, { buffer = bufnr })
                --     vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                -- end,
            },
            tools = {
                hover_actions = {
                    auto_focus = true,
                },
            },
        })
    end
}
