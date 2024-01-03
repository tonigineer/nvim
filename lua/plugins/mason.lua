return {
    "williamboman/mason.nvim",
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
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            width = 0.5,
            height = 0.5,
        },
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 10,
    },
}
