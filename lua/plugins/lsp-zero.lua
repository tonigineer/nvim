return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        lazy = false,
        config = true,
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
                border = {
                    "╭",
                    "─",
                    "╮",
                    "│",
                    "╯",
                    "─",
                    "╰",
                    "│",
                },
                width = 0.5,
                height = 0.5,
            },
            log_level = vim.log.levels.INFO,
            max_concurrent_installers = 10,
            ensure_installed = {
                "isort",
            },
        },
    },
    -- Mason Tool Installer
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "clangd",
                    "clang-format",
                    "codelldb",
                    -- LSP servers
                    "rust-analyzer",

                    "pyright",
                    "black",

                    "bash-language-server",
                    "shfmt",

                    "lua-language-server",
                    "stylua",

                    "vim-language-server",

                    "typescript-language-server",
                    "prettier",

                    "taplo",

                    "hyprls",

                    -- Formatters
                },

                -- Optional settings
                auto_update = true, -- automatically check for tool updates
                run_on_start = true, -- install/update on Neovim startup
                start_delay = 3000, -- 3-second delay to reduce potential blocking
            })
        end,
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            { "L3MON4D3/LuaSnip" },
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.
            local cmp = require("cmp")
            local cmp_action = lsp_zero.cmp_action()

            cmp.setup({
                formatting = lsp_zero.cmp_format({ details = true }),
                mapping = cmp.mapping.preset.insert({
                    -- ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-Return>"] = cmp.mapping.confirm({ select = false }),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
                    ["<C-b>"] = cmp_action.luasnip_jump_backward(),
                }),
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
            })
        end,
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "williamboman/mason-lspconfig.nvim" },
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()

            -- if you want to know more about mason.nvim
            -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            require("mason-lspconfig").setup({
                handlers = {
                    -- this first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    function(server_name)
                        require("lspconfig")[server_name].setup({})
                    end,

                    -- this is the "custom handler" for `lua_ls`
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require("lspconfig").lua_ls.setup(lua_opts)
                    end,

                    -- Disable LSP for rust here, since rustecean is used.
                    rust_analyzer = function() end,

                    pyright = function()
                        local util = require("lspconfig/util")
                        local path = util.path

                        local function get_python_path()
                            local possible_venv = path.join(
                                -- vim.fn.expand("%:p:h") .. "/.venv/bin/python"
                                vim.fn.fnamemodify(vim.fn.getcwd(), ":t"),
                                ".venv/bin/python"
                            )

                            if vim.fn.filereadable(possible_venv) then
                                return possible_venv
                            end

                            return vim.fn.exepath("python3")
                                or vim.fn.exepath("python")
                                or "python"
                        end

                        require("lspconfig").pyright.setup({
                            on_init = function(client)
                                client.config.settings.python.pythonPath =
                                    get_python_path()
                            end,
                        })
                    end,
                },
            })
        end,
    },
}
