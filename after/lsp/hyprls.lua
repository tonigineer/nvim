vim.lsp.config("hyprls", {
    cmd = { "hyprls", "--stdio" },
    filetypes = { "hyprlang" },
    root_markers = { ".git" },
    single_file_support = true,
})
