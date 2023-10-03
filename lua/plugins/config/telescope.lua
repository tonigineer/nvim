local telescope = require("telescope")

telescope.setup({
    defaults = {
        theme = "dropdown",
        file_ignore_patterns = {
            ".git/",
            "node_modules/",
            ".npm/",
            "*[Cc]ache/",
            "*-cache*",
            ".dropbox/",
            ".dropbox_trashed/",
            "*.py[co]",
            "*.sw?",
            "*~",
            "*.sql",
            "*.tags*",
            "*.gemtags*",
            "*.csv",
            "*.tsv",
            "*.tmp*",
            "*.old",
            "*.plist",
            "*.pdf",
            "*.log",
            "*.jpg",
            "*.jpeg",
            "*.png",
            "*.tar.gz",
            "*.tar",
            "*.zip",
            "*.class",
            "*.pdb",
            "*.dll",
            "*.dat",
            "*.mca",
            "__pycache__",
            ".mozilla/",
            ".electron/",
            ".vpython-root/",
            ".gradle/",
            ".nuget/",
            ".cargo/",
            ".evernote/",
            ".azure-functions-core-tools/",
            "yay/",
            ".local/share/Trash/",
            ".local/share/nvim/swap/",
            "code%-other/",
        },
        layout_config = {
            horizontal = {
                height = 0.5,
                preview_cutoff = 40,
                prompt_position = "bottom",
                width = 0.75
            },
        },
        prompt_prefix = "  ",
        initial_mode = "insert",
        border = true,
        path_display = { "truncate" },
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
})
