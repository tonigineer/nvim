return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },

    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000,
        config = function()
            require("tiny-inline-diagnostic").setup({
                use_icons_from_diagnostic = true,
                set_arrow_to_diag_color = true,
                transparent_bg = true,
                show_all_diags_on_cursorline = true,
                enable_on_insert = true,
                enable_on_select = true,
                options = { show_source = { enabled = true } },
                signs = {
                    left = "",
                    right = "",
                    diag = "●",
                    arrow = "    ",
                    up_arrow = "    ",
                    vertical = " │",
                    vertical_end = " └",
                },
                blend = { factor = 0.22 },
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim", opts = {} },
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            { "antosha417/nvim-lsp-file-operations", config = true },
            { "j-hui/fidget.nvim", opts = {} },
            "saghen/blink.cmp",
        },
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("tonigineer-lsp-attach", { clear = true }),
                callback = require("tonigineer.remap").lsp_attach,
            })

            local severity = vim.diagnostic.severity
            vim.diagnostic.config({
                signs = {
                    text = {
                        [severity.ERROR] = " ",
                        [severity.WARN] = " ",
                        [severity.HINT] = " ",
                        [severity.INFO] = " ",
                    },
                },
            })
        end,
    },

    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        cmd = "ConformInfo",
        keys = require("tonigineer.remap").conform,
        opts = {
            notify_on_error = false,
            format_on_save = function(bufnr)
                local disabled = { c = true, cpp = true }
                if disabled[vim.bo[bufnr].filetype] then return nil end
                return { timeout_ms = 500, lsp_format = "fallback" }
            end,
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                javascript = { "prettierd", "prettier", stop_after_first = true },
                markdown = { "prettierd" },
            },
            formatters = {
                stylua = {
                    prepend_args = {
                        "--indent-type", "Spaces",
                        "--indent-width", "4",
                        "--column-width", "80",
                        "--quote-style", "ForceDouble",
                        "--call-parentheses", "Always",
                        "--collapse-simple-statement", "Always",
                    },
                },
                shfmt = {
                    prepend_args = { "-i", "4", "-ci" },
                },
            },
        },
    },

    {
        "saghen/blink.cmp",
        event = "VimEnter",
        version = "1.*",
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                version = "2.*",
                build = (function()
                    if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then return end
                    return "make install_jsregexp"
                end)(),
                opts = {},
            },
            "folke/lazydev.nvim",
        },
        opts = {
            keymap = { preset = "super-tab" },
            appearance = {
                nerd_font_variant = "mono",
            },
            completion = {
                documentation = { auto_show = false, auto_show_delay_ms = 500 },
            },
            sources = {
                default = { "lsp", "path", "snippets", "lazydev" },
                providers = {
                    lazydev = {
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    },
                },
            },
            snippets = { preset = "luasnip" },
            fuzzy = { implementation = "lua" },
            signature = { enabled = true },
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        main = "nvim-treesitter.config",
        opts = {
            ensure_installed = {
                "bash", "c", "diff", "html", "lua", "luadoc",
                "markdown", "markdown_inline", "query", "vim", "vimdoc",
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "ruby" },
            },
            indent = { enable = true, disable = { "ruby" } },
        },
    },
}
