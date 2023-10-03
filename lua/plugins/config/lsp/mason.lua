-- [[ 2. LSP]]
require("mason-lspconfig").setup({
    automatic_installation = true,
    ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "pyright" },
})

-- [[ 3. DAP]]
require("mason-nvim-dap").setup({
    automatic_installation = true,
    ensure_installed = { "codelldb", "debugpy" },
})

-- [[ 4. Linter and 5. Formatter]]
require("mason-null-ls").setup({
    automatic_installation = true,
    ensure_installed = {
        "black",
        "cpplint",
        "stylua",
        "clang-format",
        "rustfmt",
        "ruff",
    },
})

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
    pip = {
        upgrade_pip = true,
    },
})
