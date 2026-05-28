vim.lsp.config("qmlls", {
    cmd = { "qmlls" },
    filetypes = { "qml", "qmljs" },
    root_markers = { ".git" },
    single_file_support = true,
})
