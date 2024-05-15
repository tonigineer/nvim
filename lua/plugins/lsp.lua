return {
    {
        "williamboman/mason.nvim",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        opts = {
            ensure_installed = {
                -- lua
                "lua-language-server",
                "stylua",
                "luacheck",
                -- bash
                "bash-language-server",
                "shellcheck",
                "shfmt",
                -- python
                "pyright",
                "black",
                "isort",
                "pylint",
                -- c/cpp
                "clangd",
                "clang-format",
                "cpplint",
                -- rust
                "rust-analyzer",
                -- json
                "json-lsp",
                -- markdown
                "marksman",
                "markdownlint",
            },
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
                border = {
                    "╭",
                    "─",
                    "╮",
                    "│",
                    "╯",
                    "─",
                    "╰",
                    "│",
                },
                width = 0.5,
                height = 0.5,
            },
            log_level = vim.log.levels.INFO,
            max_concurrent_installers = 10,
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport =
                false

            local lspconfig = require("lspconfig")
            -- lspconfig.tsserver.setup({
            --     capabilities = capabilities,
            -- })
            -- lspconfig.solargraph.setup({
            --     capabilities = capabilities,
            -- })
            -- lspconfig.html.setup({
            --     capabilities = capabilities,
            -- })

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })
            lspconfig.clang.setup({
                capabilities = capabilities,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
