return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                bash = { "shfmt", "shellcheck" },
                lua = { "stylua" },
                python = { "isort", "black" },
                rust = { "rustfmt" },
                scss = { "prettierd" },
                -- Use the "_" filetype to run formatters on filetypes that don't
                -- have other formatters configured.
                ["*"] = { "codespell" },
                ["_"] = { "trim_whitespace" },
            },
            format_on_save = {
                -- I recommend these options. See :help conform.format for details.
                lsp_fallback = true,
                timeout_ms = 500,
            },
        })

        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
                require("conform").format({
                    bufnr = args.buf,
                })
            end,
        })
    end,
}
