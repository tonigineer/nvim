local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- ──── UI HELPERS ──────────────────────────────────────────────────────────────

autocmd("FileType", {
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

autocmd("FileType", {
    pattern = "minifiles",
    callback = function(args)
        vim.keymap.set(
            "n",
            "<Esc>",
            MiniFiles.close,
            { buffer = args.buf, silent = true }
        )
    end,
})

-- ──── COLORSHEME WORKAROUND ───────────────────────────────────────────────────

autocmd("User", {
    pattern = "VeryLazy",
    once = true,
    command = "colorscheme vague",
})

-- ──── CURSOR RESTORATION ──────────────────────────────────────────────────────

autocmd("BufReadPost", {
    callback = function()
        if vim.bo.filetype:match("commit") or vim.bo.filetype == "help" then
            return
        end
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- ──── LSP ATTACH ──────────────────────────────────────────────────────────────

autocmd("LspAttach", {
    group = augroup("tonigineer-lsp-attach", { clear = true }),
    callback = require("tonigineer.remap").lsp_attach,
})
