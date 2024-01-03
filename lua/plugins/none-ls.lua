return {
    "nvimtools/none-ls.nvim",
    lazy = false,
    event = "BufReadPre",
    dependencies = {
        "jay-babu/mason-null-ls.nvim"
    },

    config = function()
        require("mason-null-ls").setup({
            automatic_installation = true,
            ensure_installed = {
                -- Bash
                "shfmt",
                "shellcheck",
                -- C/C++
                "clang_format",
                "cpplint",
                -- Json
                "fixjson",
                -- Lua
                "stylua",
                "luacheck",
                -- Markdown
                "markdownlint",
                -- Python
                "black",
                "isort",
                "pylint"
            }
        })

        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        null_ls.setup({
            sources = {
                -- Bash
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.diagnostics.shellcheck,
                -- C/C++
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.diagnostics.cpplint,
                -- Json
                null_ls.builtins.formatting.fixjson,
                -- lua
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.diagnostics.luacheck,
                -- -- markdown
                null_ls.builtins.diagnostics.markdownlint,
                -- python
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.diagnostics.pylint,
            },

            -- Format on save
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({
                        group = augroup,
                        buffer = bufnr,
                    })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                end
            end,
        })
    end

}
