require("nvim-dap-repl-highlights").setup()

require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "c",
        "cpp",
        "lua",
        "rust",
        "python",
        "cmake",
        "css",
        "dockerfile",
        "http",
        "markdown",
        "markdown_inline",
        "regex",
        "json",
        "toml",
        "bash",
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    sync_install = true,
})
