-- [[ 2. LSP]]
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "pyright" },
    automatic_installation = true,
})

-- [[ 3. DAP]]
require("mason-nvim-dap").setup({
    ensure_installed = { "codelldb" },
})

-- [[ 4. Linter and 5. Formatter]]
require("mason-null-ls").setup({
    ensure_installed = {
        "pylint",
        "isort",
        "black",
        "cpplint",
        "stylua",
        "clang-format",
        "rustfmt",
    },
})

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
    pip = {
        upgrade_pip = true,
    },
})
