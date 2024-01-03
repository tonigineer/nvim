return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",

    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = { 
                "bash",
                "c",
                "cpp",
                "rust",
                "markdown_inline",
                "markdown",
                "lua",
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
            indent = { 
                enable = true, 
                disable = { 
                    "python",
                    "css" }
            },
            tscontext_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
        })

    end
}


