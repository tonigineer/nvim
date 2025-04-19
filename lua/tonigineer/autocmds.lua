-- Hide stuff
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
    },
    callback = function()
        vim.b.miniindentscope_disable = true
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
    end,
})

-- -- Hyprlang LSP
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
--   pattern = { "*.hl", "hypr*.conf" },
--   callback = function(event)
--     print(string.format("starting hyprls for %s", vim.inspect(event)))
--     vim.lsp.start({
--       name = "hyprlang",
--       cmd = { "hyprls" },
--       root_dir = vim.fn.getcwd(),
--     })
--   end,
-- })

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
