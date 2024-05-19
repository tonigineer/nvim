return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
                ensure_installed = {
                    "bash",
                    "c",
                    "cpp",
                    "css",
                    "html",
                    "json",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "python",
                    "regex",
                    "ron",
                    "rust",
                    "toml",
                    "vim",
                },
            })
        end,
    },
}

