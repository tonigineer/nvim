return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            bash = { "shellcheck" },
            c = { "cpplint" },
            cpp = { "cpplint" },
            javascript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            python = { "pylint" },
            sh = { "shellcheck" },
            typescript = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            zsh = { "shellcheck" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("tonigineer-lint", { clear = true })

        -- ──── Lint on Save ──────────────────────────────────────────────────────────

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
