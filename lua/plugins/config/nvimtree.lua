local function my_on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
    vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
    vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
end

local tree = require("nvim-tree")

-- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
local config = {
    on_attach = my_on_attach,
    hijack_unnamed_buffer_when_opening = false,
    hijack_directories = {
        enable = false,
    },
    filters = {
        custom = { ".git" },
        exclude = { ".gitignore", ".env" },
    },
    sync_root_with_cwd = true,
    update_cwd = true,
    actions = {
        open_file = {
            quit_on_open = false,
        },
    },
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = true,
        root_folder_label = false,
        highlight_opened_files = "none",
        root_folder_modifier = ":t",
        indent_markers = {
            enable = true,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "signcolumn",
            diagnostics_placement = "after",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
                modified = true,
                diagnostics = true,
                bookmarks = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "M",
                    staged = "A",
                    unmerged = "",
                    renamed = "R",
                    untracked = "U",
                    deleted = "D",
                    ignored = "I",
                    -- unstaged = "✗",
                    -- staged = "✓",
                    -- unmerged = "",
                    -- renamed = "➜",
                    -- untracked = "★",
                    -- deleted = "",
                    -- ignored = "◌",
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        adaptive_size = false,
        width = 40,
        side = "left",
        number = false,
        relativenumber = false,
        preserve_window_proportions = true,
    },
}

tree.setup(config)
