return {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    ft = { "rust" },
    opts = {
        server = {
            on_attach = function(_, bufnr)
                vim.lsp.inlay_hint.enable(true)
                -- vim.keymap.set(
                --     "n",
                --     "<leader>cR",
                --     function() vim.cmd.RustLsp("codeAction") end,
                --     { desc = "Code Action", buffer = bufnr }
                -- )
                -- vim.keymap.set(
                --     "n",
                --     "<leader>dr",
                --     function() vim.cmd.RustLsp("debuggables") end,
                --     { desc = "Rust Debuggables", buffer = bufnr }
                -- )
                vim.keymap.set(
                    "n",
                    "<leader>ld",
                    function() vim.lsp.buf.definition() end,
                    { desc = "Definition" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>lh",
                    function() vim.lsp.buf.hover() end,
                    { desc = "Show hover" }
                )
                -- vim.keymap.set(
                --     "n",
                --     "<leader>vws",
                --     function() vim.lsp.buf.workspace_symbol() end,
                --     opts
                -- )
                -- vim.keymap.set(
                --     "n",
                --     "<leader>vd",
                --     function() vim.diagnostic.open_float() end,
                --     opts
                -- )
                vim.keymap.set(
                    "n",
                    "<leader>l[",
                    function() vim.diagnostic.goto_next() end,
                    { desc = "Next diagnositic" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>l]",
                    function() vim.diagnostic.goto_prev() end,
                    { desc = "Previous diagnositic" }
                )
                -- vim.keymap.set(
                --     "n",
                --     "<leader>vca",
                --     function() vim.lsp.buf.code_action() end,
                --     opts
                -- )
                vim.keymap.set(
                    "n",
                    "<leader>lr",
                    function() vim.lsp.buf.references() end,
                    { desc = "Show references" }
                )
                -- vim.keymap.set(
                --     "n",
                --     "<leader>vrn",
                --     function() vim.lsp.buf.rename() end,
                --     opts
                -- )
                -- vim.keymap.set(
                --     "i",
                --     "<C-h>",
                --     function() vim.lsp.buf.signature_help() end,
                --     opts
                -- )
            end,
            default_settings = {
                -- rust-analyzer language server configuration
                ["rust-analyzer"] = {
                    cargo = {
                        allFeatures = true,
                        loadOutDirsFromCheck = true,
                        buildScripts = {
                            enable = true,
                        },
                    },
                    -- Add clippy lints for Rust.
                    checkOnSave = {
                        allFeatures = true,
                        command = "clippy",
                        extraArgs = { "--no-deps" },
                    },
                    procMacro = {
                        enable = true,
                        ignored = {
                            ["async-trait"] = { "async_trait" },
                            ["napi-derive"] = { "napi" },
                            ["async-recursion"] = { "async_recursion" },
                        },
                    },
                },
            },
        },
    },
    config = function(_, opts)
        vim.g.rustaceanvim =
            vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
        if vim.fn.executable("rust-analyzer") == 0 then
            LazyVim.error(
                "**rust-analyzer** not found in PATH, please install it.\nhttps://rust-analyzer.github.io/",
                { title = "rustaceanvim" }
            )
        end
    end,
}
