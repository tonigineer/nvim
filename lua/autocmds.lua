-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args) require("conform").format({ bufnr = args.buf }) end,
})

-- Change tabwidth base on file type
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "*.html", "*.css", "*.scss", "*.lua" },
    callback = function()
        vim.opt.tabstop = 4
        vim.opt.softtabstop = 4
        vim.opt.shiftwidth = 4
    end,
})

-- Python formatting
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "*.py" },
    callback = function()
        vim.opt.textwidth = 79
        -- vim.opt.colorcolumn = 79
    end,
})

-- Disable Treesitter highlighting globally
vim.cmd(":TSDisable highlight")
