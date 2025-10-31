return {
    -- LSP Plugins
    {
        -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
        -- used for completion, annotations and signatures of Neovim apis
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    -- Main LSP configuration
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Automatically install LSPs and related tools to stdpath for Neovim
            -- Mason must be loaded before its dependents so we need to set it up here.
            -- Note: `opts = {}` is the same as calling `require('mason').setup({})`
            { "williamboman/mason.nvim",             opts = {} },
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",

            -- Update import after rename
            { "antosha417/nvim-lsp-file-operations", config = true },

            -- Useful status updates for LSP.
            { "j-hui/fidget.nvim",                   opts = {} },

            -- Allows extra capabilities provided by blink.cmp
            "saghen/blink.cmp",
        },
        config = function()
            --  This function gets run when an LSP attaches to a particular buffer.
            --    That is to say, every time a new file is opened that is associated with
            --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
            --    function will be executed to configure the current buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup(
                    "kickstart-lsp-attach",
                    { clear = true }
                ),
                callback = function(event)
                    require("which-key").add({
                        { "<leader>g", group = "Goto" },
                    })

                    local map = function(keys, func, desc, mode)
                        mode = mode or "n"
                        vim.keymap.set(
                            mode,
                            keys,
                            func,
                            { buffer = event.buf, desc = desc }
                        )
                    end

                    map("<leader>H", function()
                        local opts = {
                            focusable = true,
                            close_events = {
                                "BufLeave",
                                "CursorMoved",
                                "InsertEnter",
                                "FocusLost",
                            },
                            border = "rounded",
                            source = "always",
                            prefix = " ",
                            scope = "cursor",
                        }
                        if next(vim.lsp.get_clients()) == nil then return end
                        pcall(vim.lsp.buf.hover, opts)
                    end, "Show hover")

                    -- Rename the variable under your cursor.
                    --  Most Language Servers support renaming across files, etc.
                    vim.keymap.set("n", "<leader>R", function()
                        local function can_rename_symbol()
                            local params = vim.lsp.util.make_position_params()
                            local responses = vim.lsp.buf_request_sync(
                                0,
                                "textDocument/prepareRename",
                                params,
                                500
                            )
                            if not responses then return false end

                            for _, res in pairs(responses) do
                                if res.result then return true end
                            end
                            return false
                        end

                        local function prefill_substitute_for_cword(opts)
                            opts = opts or {}
                            local cmd = ":%s/"
                                .. vim.fn.expand("<cword>")
                                .. "/"
                            local keys = vim.api.nvim_replace_termcodes(
                                cmd,
                                true,
                                false,
                                true
                            )
                            vim.api.nvim_feedkeys(keys, "n", false)
                        end

                        if can_rename_symbol() then
                            vim.lsp.buf.rename()
                        else
                            prefill_substitute_for_cword({ boundary = true })
                        end
                    end, {
                        desc = "Rename",
                    })

                    -- Execute a code action, usually your cursor needs to be on top of an error
                    -- or a suggestion from your LSP for this to activate.
                    map(
                        "<leader>ga",
                        vim.lsp.buf.code_action,
                        "Code actions",
                        { "n", "x" }
                    )

                    -- Find references for the word under your cursor.
                    map(
                        "<leader>gr",
                        require("telescope.builtin").lsp_references,
                        "References"
                    )

                    -- Jump to the implementation of the word under your cursor.
                    --  Useful when your language has ways of declaring types without an actual implementation.
                    map(
                        "<leader>gi",
                        require("telescope.builtin").lsp_implementations,
                        "Implementation"
                    )

                    -- Jump to the definition of the word under your cursor.
                    --  This is where a variable was first declared, or where a function is defined, etc.
                    --  To jump back, press <C-t>.
                    map(
                        "<leader>gd",
                        require("telescope.builtin").lsp_definitions,
                        "Definition"
                    )

                    -- Warn: This is not Goto Definition, this is Goto Declaration.
                    --  For example, in C this would take you to the header.
                    map("<leader>gD", vim.lsp.buf.declaration, "Declaration")

                    -- Fuzzy find all the symbols in your current document.
                    --  Symbols are things like variables, functions, types, etc.
                    -- map(
                    --     "<leader>S",
                    --     require("telescope.builtin").lsp_document_symbols,
                    --     "[S]ymbols"
                    -- )

                    -- Fuzzy find all the symbols in your current workspace.
                    --  Similar to document symbols, except searches over your entire project.
                    -- map(
                    --     "<leader>W",
                    --     require("telescope.builtin").lsp_dynamic_workspace_symbols,
                    --     "[W]orkspace Symbols"
                    -- )

                    -- Jump to the type of the word under your cursor.
                    --  Useful when you're not sure what type a variable is and you want to see
                    --  the definition of its *type*, not where it was *defined*.
                    map(
                        "<leader>gt",
                        require("telescope.builtin").lsp_type_definitions,
                        "Type Definition"
                    )

                    map(
                        "<leader>D",
                        require("telescope.builtin").diagnostics,
                        "List diagnostics"
                    )

                    -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
                    ---@param client vim.lsp.Client
                    ---@param method vim.lsp.protocol.Method
                    ---@param bufnr? integer some lsp support methods only in specific files
                    ---@return boolean
                    local function client_supports_method(client, method, bufnr)
                        if vim.fn.has("nvim-0.11") == 1 then
                            return client:supports_method(method, bufnr)
                        else
                            return client.supports_method(
                                method,
                                { bufnr = bufnr }
                            )
                        end
                    end

                    -- The following two autocommands are used to highlight references of the
                    -- word under your cursor when your cursor rests there for a little while.
                    --    See `:help CursorHold` for information about when this is executed
                    --
                    -- When you move your cursor, the highlights will be cleared (the second autocommand).
                    local client =
                        vim.lsp.get_client_by_id(event.data.client_id)
                    if
                        client
                        and client_supports_method(
                            client,
                            vim.lsp.protocol.Methods.textDocument_documentHighlight,
                            event.buf
                        )
                    then
                        local highlight_augroup = vim.api.nvim_create_augroup(
                            "kickstart-lsp-highlight",
                            { clear = false }
                        )
                        vim.api.nvim_create_autocmd(
                            { "CursorHold", "CursorHoldI" },
                            {
                                buffer = event.buf,
                                group = highlight_augroup,
                                callback = vim.lsp.buf.document_highlight,
                            }
                        )

                        vim.api.nvim_create_autocmd(
                            { "CursorMoved", "CursorMovedI" },
                            {
                                buffer = event.buf,
                                group = highlight_augroup,
                                callback = vim.lsp.buf.clear_references,
                            }
                        )

                        vim.api.nvim_create_autocmd("LspDetach", {
                            group = vim.api.nvim_create_augroup(
                                "kickstart-lsp-detach",
                                { clear = true }
                            ),
                            callback = function(event2)
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds({
                                    group = "kickstart-lsp-highlight",
                                    buffer = event2.buf,
                                })
                            end,
                        })
                    end

                    -- The following code creates a keymap to toggle inlay hints in your
                    -- code, if the language server you are using supports them
                    --
                    -- This may be unwanted, since they displace some of your code
                    if
                        client
                        and client_supports_method(
                            client,
                            vim.lsp.protocol.Methods.textDocument_inlayHint,
                            event.buf
                        )
                    then
                        require("which-key").add({
                            { "<leader>t", group = "Toggles" },
                        })

                        map(
                            "<leader>th",
                            function()
                                vim.lsp.inlay_hint.enable(
                                    not vim.lsp.inlay_hint.is_enabled({
                                        bufnr = event.buf,
                                    })
                                )
                            end,
                            "Inlay hints"
                        )
                    end
                end,
            })

            -- Diagnostic Config
            -- See :help vim.diagnostic.Opts
            local severity = vim.diagnostic.severity
            vim.diagnostic.config({
                signs = {
                    text = {
                        [severity.ERROR] = " ", -- error (circle with x)
                        [severity.WARN] = " ", -- warning (rounded)
                        [severity.HINT] = " ", -- lightbulb (rounded)
                        [severity.INFO] = " ", -- info (rounded)
                    },
                    -- text = {
                    --     [severity.ERROR] = " ",
                    --     [severity.WARN] = " ",
                    --     [severity.HINT] = "󰠠 ",
                    --     [severity.INFO] = " ",
                    -- },
                },
            })

            -- LSP servers and clients are able to communicate to each other what features they support.
            --  By default, Neovim doesn't support everything that is in the LSP specification.
            --  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
            --  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            -- Configured in root:/after/lsp/...
            -- local servers = {
            --     clangd = {},
            --     pyright = {},
            --     rust_analyzer = {},
            --     lua_ls = {},
            -- }
        end,
    },

    { -- Autoformat
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>F",
                function()
                    require("conform").format({
                        async = true,
                        lsp_format = "fallback",
                    })
                end,
                mode = "",
                desc = "Format",
            },
        },
        opts = {
            notify_on_error = false,
            format_on_save = function(bufnr)
                -- Disable "format_on_save lsp_fallback" for languages that don't
                -- have a well standardized coding style. You can add additional
                -- languages here or re-enable it for the disabled ones.
                local disable_filetypes = { c = true, cpp = true }
                if disable_filetypes[vim.bo[bufnr].filetype] then
                    return nil
                else
                    return {
                        timeout_ms = 500,
                        lsp_format = "fallback",
                    }
                end
            end,
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform can also run multiple formatters sequentially
                python = { "isort", "black" },
                -- You can use 'stop_after_first' to run the first available formatter from the list
                javascript = {
                    "prettierd",
                    "prettier",
                    stop_after_first = true,
                },
                markdown = { "prettierd" }, -- or "markdownlint" / "prettier"
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

    { -- Autocompletion
        "saghen/blink.cmp",
        event = "VimEnter",
        version = "1.*",
        dependencies = {
            -- Snippet Engine
            {
                "L3MON4D3/LuaSnip",
                version = "2.*",
                build = (function()
                    -- Build Step is needed for regex support in snippets.
                    -- This step is not supported in many windows environments.
                    -- Remove the below condition to re-enable on windows.
                    if
                        vim.fn.has("win32") == 1
                        or vim.fn.executable("make") == 0
                    then
                        return
                    end
                    return "make install_jsregexp"
                end)(),
                dependencies = {
                    -- `friendly-snippets` contains a variety of premade snippets.
                    --    See the README about individual language/framework/plugin snippets:
                    --    https://github.com/rafamadriz/friendly-snippets
                    -- {
                    --   'rafamadriz/friendly-snippets',
                    --   config = function()
                    --     require('luasnip.loaders.from_vscode').lazy_load()
                    --   end,
                    -- },
                },
                opts = {},
            },
            "folke/lazydev.nvim",
        },
        --- @module 'blink.cmp'
        --- @type blink.cmp.Config
        opts = {
            keymap = {
                -- 'default' (recommended) for mappings similar to built-in completions
                --   <c-y> to accept ([y]es) the completion.
                --    This will auto-import if your LSP supports it.
                --    This will expand snippets if the LSP sent a snippet.
                -- 'super-tab' for tab to accept
                -- 'enter' for enter to accept
                -- 'none' for no mappings
                --
                -- For an understanding of why the 'default' preset is recommended,
                -- you will need to read `:help ins-completion`
                --
                -- No, but seriously. Please read `:help ins-completion`, it is really good!
                --
                -- All presets have the following mappings:
                -- <tab>/<s-tab>: move to right/left of your snippet expansion
                -- <c-space>: Open menu or open docs if already open
                -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
                -- <c-e>: Hide menu
                -- <c-k>: Toggle signature help
                --
                -- See :h blink-cmp-config-keymap for defining your own keymap
                -- preset = "default",
                preset = "super-tab",

                -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
                --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
            },

            appearance = {
                -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = "mono",
            },

            completion = {
                -- By default, you may press `<c-space>` to show the documentation.
                -- Optionally, set `auto_show = true` to show the documentation after a delay.
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

            -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
            -- which automatically downloads a prebuilt binary when enabled.
            --
            -- By default, we use the Lua implementation instead, but you may enable
            -- the rust implementation via `'prefer_rust_with_warning'`
            --
            -- See :h blink-cmp-config-fuzzy for more information
            fuzzy = { implementation = "lua" },

            -- Shows a signature help window while you type arguments for a function
            signature = { enabled = true },
        },
    },

    { -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        main = "nvim-treesitter.configs", -- Sets main module to use for opts
        -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
        opts = {
            -- ensure_installed = {
            --     "bash",
            --     "c",
            --     "diff",
            --     "html",
            --     "lua",
            --     "luadoc",
            --     "markdown",
            --     "markdown_inline",
            --     "query",
            --     "vim",
            --     "vimdoc",
            -- },
            -- Autoinstall languages that are not installed
            auto_install = true,
            highlight = {
                enable = true,
                -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
                --  If you are experiencing weird indenting issues, add the language to
                --  the list of additional_vim_regex_highlighting and disabled languages for indent.
                additional_vim_regex_highlighting = { "ruby" },
            },
            indent = { enable = true, disable = { "ruby" } },
        },
        -- There are additional nvim-treesitter modules that you can use to interact
        -- with nvim-treesitter. You should go explore a few and see what interests you:
        --
        --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
        --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
        --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    },
}
