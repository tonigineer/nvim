return {
    {
        "williamboman/mason.nvim",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        opts = {
            ensure_installed = { -- lua
                "lua-language-server",
                "stylua",
                "luacheck", -- bash
                "bash-language-server",
                "shellcheck",
                "shfmt", -- python
                "pyright",
                "black",
                "isort",
                "pylint", -- c/cpp
                "clangd",
                "clang-format",
                "cpplint", -- rust
                "rust-analyzer",
                "clippy", -- json
                "json-lsp", -- markdown
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

            lspconfig.rust_analyzer.setup({
                settings = {
                    ["rust-analyzer"] = {
                        check = {
                            command = "clippy",
                        },
                        diagnostics = {
                            enable = true,
                        },
                        cargo = {
                            allFeatures = true,
                        },
                    },
                },
                root_dir = lspconfig.util.root_pattern("Cargo.toml"),
                filetypes = { "rust" },
            })

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.pyright.setup({
                capabilities = capabilities,
            })

            lspconfig.clang.setup({
                capabilities = capabilities,
            })

            local wk = require("which-key")
            wk.register({
                ["<leader>g"] = { "Go to" },
                ["<leader>K"] = { ":lua vim.lsp.buf.hover() <cr>", "Hover" },
                ["<leader>gd"] = {
                    ":lua vim.lsp.buf.definition() <cr>",
                    "Definition",
                },
                ["<leader>gr"] = {
                    ":lua vim.lsp.buf.references() <cr>",
                    "References",
                },
            })
        end,
    },
    {
        "saecki/crates.nvim",
        ft = { "rust", "toml" },

        config = function()
            local wk = require("which-key")
            wk.register({
                ["<leader>r"] = { "Rust" },
                ["<leader>rc"] = { "Crates" },
                ["<leader>rcu"] = {
                    ":lua require('crates').upgrade_all_crates() <cr>",
                    "Upgrade all crates",
                },
            })

            require("crates").setup({})
        end,
    },
}
