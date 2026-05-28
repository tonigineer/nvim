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

            local servers = {
                "bashls",
                "clangd",
                "hyprls",
                "jsonls",
                "lua_ls",
                "pyright",
                "qmlls",
                "rust_analyzer",
            }
            for _, server in ipairs(servers) do
                vim.lsp.enable(server)
            end
        end,
    },

    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        cmd = "ConformInfo",
        keys = require("tonigineer.remap").conform,
        opts = {
            notify_on_error = false,
            format_on_save = false,
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                javascript = {
                    "prettierd",
                    "prettier",
                    stop_after_first = true,
                },
                markdown = { "prettierd" },
            },
            formatters = {
                stylua = {
                    prepend_args = {
                        "--indent-type",
                        "Spaces",
                        "--indent-width",
                        "4",
                        "--column-width",
                        "80",
                        "--quote-style",
                        "ForceDouble",
                        "--call-parentheses",
                        "Always",
                        "--collapse-simple-statement",
                        "Always",
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
                    if
                        vim.fn.has("win32") == 1
                        or vim.fn.executable("make") == 0
                    then
                        return
                    end
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
        config = function()
            local ensure_installed = {
                "bash",
                "c",
                "diff",
                "html",
                "lua",
                "luadoc",
                "markdown",
                "markdown_inline",
                "query",
                "vim",
                "vimdoc",
            }

            -- -- Block until hover-critical parsers exist so LSP hover never
            -- -- triggers a "No parser for language markdown" error.
            -- -- After first install this is a no-op.
            -- for _, lang in ipairs({ "markdown", "markdown_inline" }) do
            --     local paths = vim.api.nvim_get_runtime_file(
            --         "parser/" .. lang .. ".so",
            --         true
            --     )
            --     if #paths == 0 then pcall(vim.cmd, "TSInstallSync " .. lang) end
            -- end

            require("nvim-treesitter.config").setup({
                ensure_installed = ensure_installed,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = { "ruby" },
                },
                indent = { enable = true, disable = { "ruby" } },
            })
        end,
    },
}
