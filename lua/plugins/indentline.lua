return {
    -- {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "VeryLazy",
    opts = {
        symbol = "▏",
        -- symbol = "│",
        -- symbol = " ",
        -- symbol = "╎",
        options = {
            try_as_border = true,
            indent_at_cursor = false,
            border = "both",
        },
        draw = {
            delay = 10,
            animation = function() return 0 end,
        },
    },
    init = function()
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
            callback = function() vim.b.miniindentscope_disable = true end,
        })
    end,
    -- },
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     main = "ibl",
    --     opts = {
    --         scope = { enabled = false },
    --         exclude = {
    --             filetypes = { "dashboard", "mason" },
    --             buftypes = {},
    --         },
    --     },
    -- },
}
