return {
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "bashls",
                "clangd",
                "cpplint",
                "hyprls",
                "lua_ls",
                "pylint",
                "pyright",
                "qmlls",
                "rust_analyzer",
            },
        },
        dependencies = {
            {
                "williamboman/mason.nvim",
                opts = {
                    ui = {
                        icons = {
                            package_installed = "✓",
                            package_pending = "➜",
                            package_uninstalled = "✗",
                        },
                    },
                },
            },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "black",
                "clang-format",
                "eslint_d",
                "isort",
                "prettier",
                "prettierd",
                "pylint",
                "shfmt",
                "shellcheck",
                "stylua",
            },
        },
        dependencies = {
            "williamboman/mason.nvim",
        },
    },
}
