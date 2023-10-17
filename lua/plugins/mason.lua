local settings = {
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
}

return {
    "williamboman/mason.nvim",
    cmd = "Mason",
    event = "BufReadPre",

    config = function()
        require("mason").setup(settings)

        require("mason-lspconfig").setup {
            ensure_installed = {
                "lua_ls",
                "pyright",
                "clangd",
                "rust_analyzer",
                "bashls",
                "jsonls"
            },
            automatic_installation = true,
        }

        require("mason-nvim-dap").setup({
            automatic_installation = true,
            ensure_installed = {
                "codelldb",
                "debugpy"
            },
        })

        require("mason-null-ls").setup({
            automatic_installation = true,
            ensure_installed = {
                -- Lua
                "stylua",
                "checklua",
                -- C/C++
                "clang_format",
                "cpplint",
                -- Python
                "black",
                "pylint",
                -- Bash
                "shfmt",
                "spellcheck",
                -- Json
                "fixjson"
            },
        })
    end
}
