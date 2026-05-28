return {
    -- ——— Indentation —————————————————————————————————————————————————————————
    "tpope/vim-sleuth",

    -- ——— Git —————————————————————————————————————————————————————————————————
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            signs = {
                -- add = { text = "⊕" },
                -- change = { text = "◍" },
                -- delete = { text = "⊖" },
                -- topdelete = { text = "⊖" },
                -- changedelete = { text = "◌" },
                -- untracked = { text = "○" },
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "▎" },

            },
        },
    },

    -- ——— Which-key ———————————————————————————————————————————————————————————
    {
        "folke/which-key.nvim",
        event = "VimEnter",
        opts = {
            delay = 0,
            icons = {
                mappings = vim.g.have_nerd_font,
                keys = vim.g.have_nerd_font and {} or {
                    Up = "<Up> ",
                    Down = "<Down> ",
                    Left = "<Left> ",
                    Right = "<Right> ",
                    C = "<C-…> ",
                    M = "<M-…> ",
                    D = "<D-…> ",
                    S = "<S-…> ",
                    CR = "<CR> ",
                    Esc = "<Esc> ",
                    ScrollWheelDown = "<ScrollWheelDown> ",
                    ScrollWheelUp = "<ScrollWheelUp> ",
                    NL = "<NL> ",
                    BS = "<BS> ",
                    Space = "<Space> ",
                    Tab = "<Tab> ",
                    F1 = "<F1>",
                    F2 = "<F2>",
                    F3 = "<F3>",
                    F4 = "<F4>",
                    F5 = "<F5>",
                    F6 = "<F6>",
                    F7 = "<F7>",
                    F8 = "<F8>",
                    F9 = "<F9>",
                    F10 = "<F10>",
                    F11 = "<F11>",
                    F12 = "<F12>",
                },
            },
            spec = {
                { "<leader>s", group = "Search" },
                { "<leader>t", group = "Toggle" },
            },
        },
    },

    -- ——— Telescope ———————————————————————————————————————————————————————————
    {
        "nvim-telescope/telescope.nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable("make") == 1
                end,
            },
            "nvim-telescope/telescope-ui-select.nvim",
            { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
        },
        keys = require("tonigineer.remap").telescope,
        config = function()
            local telescope = require("telescope")
            local themes = require("telescope.themes")

            local fd = vim.fn.executable("fd") == 1 and "fd" or "fdfind"

            telescope.setup({
                defaults = {
                    file_ignore_patterns = { "%.git/" },
                },
                pickers = {
                    find_files = {
                        find_command = {
                            fd,
                            "--type",
                            "f",
                            "--hidden",
                            "--follow",
                            "--exclude",
                            ".git",
                        },
                    },
                    live_grep = {
                        additional_args = function()
                            return { "--hidden", "--glob", "!.git/*" }
                        end,
                    },
                },
                extensions = {
                    ["ui-select"] = { themes.get_dropdown() },
                },
            })

            vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
            vim.api.nvim_set_hl(0, "TelescopeSelection", {
                bg = "none",
                fg = "#FFFFFF",
                underline = false,
            })

            pcall(telescope.load_extension, "fzf")
            pcall(telescope.load_extension, "ui-select")
        end,
    },
}
