return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "mason-org/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",
        "leoluz/nvim-dap-go",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        require("mason-nvim-dap").setup({
            automatic_installation = true,
            handlers = {},
            ensure_installed = {
                "codelldb",
            },
        })

        -- Change breakpoint icons
        vim.api.nvim_set_hl(0, "DapBreak", { link = "DiagnosticError" })
        vim.api.nvim_set_hl(0, "DapStop", { link = "DiagnosticWarn" })

        vim.fn.sign_define(
            "DapBreakpoint",
            { text = "●", texthl = "DapBreak" }
        )
        vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DapStop" })

        -- GUI settings
        dapui.setup({
            controls = {
                element = "repl",
                enabled = false,
                icons = {
                    disconnect = "",
                    pause = "",
                    play = "",
                    run_last = "",
                    step_back = "",
                    step_into = "",
                    step_out = "",
                    step_over = "",
                    terminate = "",
                },
            },
            element_mappings = {},
            expand_lines = true,
            floating = {
                border = "double",
                mappings = {
                    close = { "q", "<Esc>" },
                },
            },
            force_buffers = true,
            icons = {
                collapsed = "",
                current_frame = "",
                expanded = "",
            },
            layouts = {
                {
                    elements = {
                        {
                            id = "scopes",
                            size = 1.0,
                        },
                        -- {
                        --     id = "breakpoints",
                        --     size = 0.25,
                        -- },
                        -- {
                        --     id = "stacks",
                        --     size = 0.25,
                        -- },
                        -- {
                        --     id = "watches",
                        --     size = 0.25,
                        -- },
                    },
                    position = "bottom",
                    size = 10,
                },
                -- {
                --     elements = {
                --         {
                --             id = "repl",
                --             size = 0.5,
                --         },
                --         {
                --             id = "console",
                --             size = 0.5,
                --         },
                --     },
                --     position = "bottom",
                --     size = 10,
                -- },
            },
            mappings = {
                edit = "e",
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                repl = "r",
                toggle = "t",
            },
            render = {
                indent = 1,
                max_value_lines = 100,
            },
        })

        dap.listeners.after.event_initialized["dapui_config"] = dapui.open
        dap.listeners.before.event_terminated["dapui_config"] = dapui.close
        dap.listeners.before.event_exited["dapui_config"] = dapui.close

        -- Configurations
        dap.adapters.codelldb = {
            type = "executable",
            command = "codelldb",
        }

        dap.configurations.rust = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    local files = vim.fn.glob(
                        vim.fn.getcwd() .. "/target/debug/*",
                        false,
                        true
                    )
                    for _, f in ipairs(files) do
                        if vim.fn.executable(f) == 1 then return f end
                    end
                    return vim.fn.input(
                        "Path to executable: ",
                        vim.fn.getcwd() .. "/",
                        "file"
                    )
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
            },
        }
        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input(
                        "Path to executable: ",
                        vim.fn.getcwd() .. "/",
                        "file"
                    )
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
            },
        }
        dap.configurations.c = dap.configurations.cpp

        -- Keybinds only when debugging
        local function set_dap_maps()
            local o = { silent = true }
            vim.keymap.set(
                "n",
                "<leader>i",
                dap.step_into,
                vim.tbl_extend("force", o, { desc = "Debug: Step Into" })
            )
            vim.keymap.set(
                "n",
                "<leader>o",
                dap.step_over,
                vim.tbl_extend("force", o, { desc = "Debug: Step Over" })
            )
            vim.keymap.set(
                "n",
                "<leader>u",
                dap.step_out,
                vim.tbl_extend("force", o, { desc = "Debug: Step Out" })
            )
        end

        local function del_dap_maps()
            pcall(vim.keymap.del, "n", "<leader>i")
            pcall(vim.keymap.del, "n", "<leader>o")
            pcall(vim.keymap.del, "n", "<leader>u")
        end

        dap.listeners.after.event_initialized["dap_session_keys"] = function()
            set_dap_maps()
        end
        dap.listeners.before.event_terminated["dap_session_keys"] = function()
            del_dap_maps()
        end
        dap.listeners.before.event_exited["dap_session_keys"] = function()
            del_dap_maps()
        end
    end,
}
