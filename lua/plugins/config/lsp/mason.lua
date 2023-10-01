-- [[ 2. LSP]]
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "pyright" },
}

-- [[ 3. DAP]]
require("mason-nvim-dap").setup({
    ensure_installed = { "codelldb" }
})

-- [[ 5. Formatter]]
require("mason-null-ls").setup({
    ensure_installed = { "stylua", "clang-format", "rustfmt" }
})

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    pip = {
        upgrade_pip = true,
    },
})
