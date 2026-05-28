return {
    -- ——— Lua development —————————————————————————————————————————————————————
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },

    -- ——— Mason ———————————————————————————————————————————————————————————————
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { { "mason-org/mason.nvim", opts = {} } },
        opts = {
            ensure_installed = {
                -- LSP servers
                "lua-language-server",
                "bash-language-server",
                "json-lsp",
                "pyright",
                "clangd",
                "rust-analyzer",

                -- Formatters
                "stylua",
                "isort",
                "black",
                "prettierd",
                "prettier",
                "shfmt",

                -- Linters
                "shellcheck",
            },
        },
    },

    -- ——— LSP —————————————————————————————————————————————————————————————————
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "antosha417/nvim-lsp-file-operations", config = true },
            { "j-hui/fidget.nvim", opts = {} },
            "saghen/blink.cmp",
        },
        config = function()
            local severity = vim.diagnostic.severity
            vim.diagnostic.config({
                virtual_text = false,
                signs = {
                    text = {
                        [severity.ERROR] = " ",
                        [severity.WARN] = " ",
                        [severity.HINT] = " ",
                        [severity.INFO] = " ",
                    },
                },
            })

            local servers = {
                "bashls",
                "clangd",
                "jsonls",
                "lua_ls",
                "pyright",
                "rust_analyzer",
            }
            for _, server in ipairs(servers) do
                vim.lsp.enable(server)
            end
        end,
    },

    -- ——— Linting —————————————————————————————————————————————————————————————
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPost", "BufNewFile", "BufWritePost" },
        config = function()
            local lint = require("lint")
            lint.linters_by_ft = {
                sh = { "shellcheck" },
                bash = { "shellcheck" },
            }

            local group =
                vim.api.nvim_create_augroup("nvim-lint", { clear = true })
            vim.api.nvim_create_autocmd(
                { "BufWritePost", "BufReadPost", "InsertLeave" },
                {
                    group = group,
                    callback = function() lint.try_lint() end,
                }
            )
        end,
    },

    -- ——— Formatting ——————————————————————————————————————————————————————————
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        cmd = "ConformInfo",
        keys = require("tonigineer.remap").conform,
        opts = {
            notify_on_error = true,
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

    -- ——— Completion ——————————————————————————————————————————————————————————
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
            appearance = { nerd_font_variant = "mono" },
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

    -- ——— Inline diagnostics ——————————————————————————————————————————————————
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
                    left = "",
                    right = "",
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

-- ——— Treesitter ——————————————————————————————————————————————————————————
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        branch = "main",
        build = ":TSUpdate",
        config = function()
            local parsers = {
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

            require("nvim-treesitter").setup()
            require("nvim-treesitter").install(parsers)

            local group =
                vim.api.nvim_create_augroup("treesitter", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                group = group,
                callback = function(args)
                    local buf = args.buf
                    if not pcall(vim.treesitter.start, buf) then
                        return
                    end
                    vim.bo[buf].indentexpr =
                        "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
}
