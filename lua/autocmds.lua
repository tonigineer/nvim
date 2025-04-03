-- -- Format on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     pattern = "*",
--     callback = function(args) require("conform").format({ bufnr = args.buf }) end,
-- })

-- -- Change tabwidth base on file type
-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--     pattern = { "*.html", "*.css", "*.scss", "*.lua" },
--     callback = function()
--         vim.opt.tabstop = 4
--         vim.opt.softtabstop = 4
--         vim.opt.shiftwidth = 4
--     end,
-- })

-- -- Python formatting
-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--     pattern = { "*.py" },
--     callback = function()
--         vim.opt.textwidth = 79
--         -- vim.opt.colorcolumn = 79
--     end,
-- })

-- Hyprlang LSP
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.hl", "hypr*.conf" },
    callback = function(event)
        print(string.format("starting hyprls for %s", vim.inspect(event)))
        vim.lsp.start({
            name = "hyprlang",
            cmd = { "hyprls" },
            root_dir = vim.fn.getcwd(),
        })
    end,
})

-- Style inlay hints
vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#868386", italic = true })

-- Enable inlay hints
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})

-- Enable hover of diagnostic window when in line
vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
        local opts = {
            focusable = false,
            close_events = {
                "BufLeave",
                "CursorMoved",
                "InsertEnter",
                "FocusLost",
            },
            border = "rounded",
            source = "always",
            prefix = " ",
            scope = "cursor",
        }
        vim.diagnostic.open_float(nil, opts)
    end,
})

-- Disable Treesitter highlighting globally
vim.cmd(":TSDisable highlight")
