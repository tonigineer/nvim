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

        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        local on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts)
            vim.keymap.set("n", "<leader>gD", "<cmd>Lspsaga goto_definition<CR>", opts)
            vim.keymap.set("n", "<leader>gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
            vim.keymap.set("n", "<leader>gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
            vim.keymap.set("n", "<leader>gK", "<cmd>Lspsaga hover_doc<CR>", opts)

            if client.name == "pyright" then
                vim.keymap.set("n", "<Leader>gi", "<cmd>PyrightOrganizeImports<CR>", opts)
            end
        end
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- bash
        lspconfig.bashls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "sh" },
        })

        -- C/C++
        local capabilities_edit = capabilities
        capabilities_edit.offsetEncoding = { "utf-16" }
        lspconfig["clangd"].setup({
            capabilities = capabilities_edit,
            on_attach = on_attach,
        })

        -- -- docker
        -- lspconfig.dockerls.setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })

        -- -- html, typescriptreact, javascriptreact, css, sass, scss, less, svelte, vue
        -- lspconfig.emmet_ls.setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        --     filetypes = {
        --         "css",
        --     },
        -- })

        -- json
        lspconfig.jsonls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "json", "jsonc" },
        })

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

        -- Markdown
        lspconfig["marksman"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- Python
        lspconfig["pyright"].setup({
            capabilities = capabilities,
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
