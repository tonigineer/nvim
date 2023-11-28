return {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",

    build = function()
        vim.cmd(":TSUpdate")
    end,

    dependencies = {
        {
            "JoosepAlviste/nvim-ts-context-commentstring",
            event = "VeryLazy",
        },
        {
            "nvim-tree/nvim-web-devicons",
            event = "VeryLazy",
        },
        {
            "LiadOz/nvim-dap-repl-highlights",
            event = "VeryLazy"
        }
    },

    config = function()
        -- local treesitter = require "nvim-treesitter"
        require('nvim-dap-repl-highlights').setup()
        local configs = require "nvim-treesitter.configs"

        configs.setup {
            ensure_installed = {
                "bash",
                "dap_repl",
                "lua",
                "markdown_inline",
                "markdown",
                "python",
                "regex",
                "rust",
                "vim",
            },
            ignore_install = { "" },
            sync_install = false,
            highlight = {
                enable = true,    -- false will disable the whole extension
                disable = { "" }, -- list of language that will be disabled
            },
            autopairs = {
                enable = true,
            },
            indent = { enable = true, disable = { "python", "css" } },
            tscontext_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
        }
    end
}
