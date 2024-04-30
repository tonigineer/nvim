return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function()
        return {
            close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
            default_component_configs = {
                indent = {
                    with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
                git_status = {
                    symbols = {
                        -- Change type
                        added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                        modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
                        deleted = "✖", -- this can only be used in the git_status source
                        renamed = "󰁕", -- this can only be used in the git_status source
                        -- Status type
                        untracked = "?",
                        ignored = "",
                        unstaged = "󰄱",
                        staged = "",
                        conflict = "",
                    },
                },
                name = {
                    use_git_status_colors = true,
                },
            },
            window = {
                position = "left",
                width = 35,
                mapping_options = {
                    noremap = true,
                    nowait = true,
                },
            },
        }
    end,
}
