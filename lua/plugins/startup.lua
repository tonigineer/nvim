return {
    "startup-nvim/startup.nvim",
    event = "VimEnter",

    config = function()
        local default_margin = 10
        local settings = {
            header = {
                type = "text",
                oldfiles_directory = false,
                align = "center",
                fold_section = false,
                title = "Header",
                margin = default_margin,
                content = {
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⡀⢀⠄⠂⢄⠀⠀⠀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⡏⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⢩⡇⠀⠀⠀⠑⢄⡏⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠣⠤⡄⠀⠀⠀⠀⠀⠀⠀⣤⣤⣾⠇⠀⠀⠀⠀⠀⠣⣤⠄⠀⠀⠀⠀⠀⠀⠀⢀⣠⡶⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⡠⠚⠁⠀⠀⠀⠀⠀⠀⢀⣴⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⡿⣿⠀⠀⠀⢀⡴⠋⠀⠀⠀⠀⠀⠀⠀⡀⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⣿⣿⠀⣠⠖⠉⠀⠀⠀⠀⠀⠀⠀⣠⣾⠟⠁⠢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⢀⠤⢊⡇⠀⠀⠀⠀⠀⠀⠀⣿⡿⠞⠁⠀⠀⠀⠀⠀⠀⢀⣀⡾⠋⠁⠀⠀⠀⠈⠢⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⢀⣔⡁⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠏⠀⠀⠀⠀⠀⠀⠀⢀⣴⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⣑⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠉⠻⣦⣸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣤⡟⠉⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣇⣀⡼⠁⠀⠀⠀⠀⠀⠀⠀⢀⣴⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣞⡛⠓⢲⠀⣖⡒⠒⢦⣀⠴⠒⠺⣟⡡⠒⠒⢤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⢀⣴⡿⠋⡼⠀⢠⠏⠀⡞⠀⣰⢒⣶⠆⠀⡔⠒⢲⠂⢀⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⣀⣰⣿⣍⠀⣼⠁⢀⡞⠀⡼⠁⢰⣷⠿⡟⠀⣸⠁⢀⠇⠀⡼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠣⣠⣤⣤⡾⠛⠁⠀⠙⢷⣧⡤⠼⠖⠰⣧⣤⠿⠁⠸⠥⠤⠷⠀⠾⠤⠴⠗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⣦⣠⡾⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                },
                highlight = "Statement",
                default_color = "",
                oldfiles_amount = 0,
            },
            body = {
                type = "mapping",
                oldfiles_directory = false,
                align = "center",
                fold_section = false,
                title = "Basic Commands",
                margin = default_margin,
                content = {
                    { "  󰇙 Files", ':lua require"telescope.builtin".find_files({ hidden = true })', "<leader>ff" },
                    { "  󰇙 Grep", ':lua require"telescope.builtin".live_grep()', "<leader>fg" },
                    { "  󰇙 Old files", ':lua require"telescope.builtin".oldfiles()', "<leader>fo" },
                    { "  󰇙 New", ":lua require'startup'.new_file()", "<leader>fn" },
                },
                highlight = "String",
                default_color = "",
                oldfiles_amount = 0,
            },
            footer = {
                type = "text",
                oldfiles_directory = false,
                align = "center",
                fold_section = false,
                title = "Footer",
                margin = default_margin,
                content = { "https://github.com/tonigineer/.dotfiles", "" },
                highlight = "Number",
                default_color = "",
                oldfiles_amount = 0,
            },
            clock = {
                type = "text",
                content = function()
                    return { "  " .. os.date("%H:%M") .. " Uhr  --    " .. os.date("%A, %d.%m.%y") }
                end,
                oldfiles_directory = false,
                align = "center",
                fold_section = false,
                title = "",
                margin = 0,
                highlight = "TSString",
                default_color = "",
                oldfiles_amount = 10,
            },
            options = {
                mapping_keys = true,
                cursor_column = 0.5,
                empty_lines_between_mappings = true,
                disable_statuslines = true,
                paddings = { 1, 0, 2, 2, 0 },
            },
            mappings = {
                execute_command = "<CR>",
                open_file = "o",
                open_file_split = "<c-o>",
                open_section = "<TAB>",
                open_help = "?",
            },
            colors = {
                background = "#6e6a86",
                folded_section = "#3e8fb0",
            },
            parts = { "header", "body", "clock", "footer", },
        }

        require("startup").setup(settings)
    end
}

