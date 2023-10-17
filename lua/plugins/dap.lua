return {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/cmp-dap",
        "LiadOz/nvim-dap-repl-highlights",
        "mfussenegger/nvim-dap-python"
    },

    config = function()
        local dap = require("dap")
        local mason_registry = require("mason-registry")

        -- [[ ---------- C/C++ ---------- ]]
        local codelldb = mason_registry.get_package("codelldb")
        local extension_path = codelldb:get_install_path() .. "/extension/"
        local codelldb_path = extension_path .. "adapter/codelldb"
        -- local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
        dap.adapters.codelldb = {
            type = "server",

            port = "${port}",
            executable = {
                -- command = '/usr/bin/codelldb',  -- install codelldb-bin with pacman
                command = codelldb_path,
                args = { "--port", "${port}" },
            },
        }

        dap.configurations.cpp = {
            {
                name = "C++/C File",
                type = "codelldb",
                request = "launch",
                program = function()
                    local filetype = vim.bo.filetype
                    local filename = vim.fn.expand("%")
                    local basename = vim.fn.expand("%:t:r")
                    if filetype == "c" then
                        os.execute(string.format("gcc -g -o %s %s", basename, filename))
                    else
                        os.execute(string.format("g++ -g -o %s %s", basename, filename))
                    end
                    return basename
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                showDisassembly = "never",
            },
            -- {
            --     name = "C++/C with CMake",
            --     type = "codelldb",
            --     request = "launch",
            --     program = function()
            --         local command = "find ! -type d -path './build/bin/*' | grep -v 'Test' | sed 's#.*/##'"
            --         local bin_location = io.popen(command, "r")
            --         if (bin_location ~= nil) then
            --             return "build/bin/" .. bin_location:read("*a"):gsub("[\n\r]", "")
            --         else
            --             return ""
            --         end
            --     end,
            --     cwd = "${workspaceFolder}",
            --     stopOnEntry = false,
            --     showDisassembly = "never",
            --     args = function()
            --         local argv = {}
            --         arg = vim.fn.input(string.format("Arguments: "))
            --         for a in string.gmatch(arg, "%S+") do
            --             table.insert(argv, a)
            --         end
            --         vim.cmd('echo ""')
            --         return argv
            --     end
            -- },
            -- {
            --     name = "C++/C Tests with CMake",
            --     type = "codelldb",
            --     request = "launch",
            --     program = "build/bin/Test",
            --     cwd = "${workspaceFolder}",
            --     stopOnEntry = false,
            --     showDisassembly = "never",
            --     args = function()
            --         local argv = {}
            --         arg = vim.fn.input(string.format("Arguments: "))
            --         for a in string.gmatch(arg, "%S+") do
            --             table.insert(argv, a)
            --         end
            --         vim.cmd('echo ""')
            --         return argv
            --     end
            -- },
        }

        dap.configurations.c = dap.configurations.cpp

        -- [[ ---------- Python ---------- ]]
        local debugpy = mason_registry.get_package("debugpy")
        dap.adapters.python = {
            python = {
                type = "executable",
                command = debugpy:get_install_path() .. "/venv/bin/python",
                args = { "-m", "debugpy.adapter" },
            },
        }

        dap.configurations.python = {
            {
                type = "python",
                request = "launch",
                name = "Run file",
                program = "${file}",
                pythonPath = function()
                    local cwd = vim.fn.getcwd()
                    if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                        return cwd .. "/venv/bin/python"
                    elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                        return cwd .. "/.venv/bin/python"
                    else
                        return "/usr/bin/python"
                    end
                end,
            }
        }, require("dap-python").setup(debugpy:get_install_path() .. "/venv/bin/python")
        -- Line above can be move down without , -- but then 5 options for debugging are shown
        -- and not only the one defined above. WEIRD!

        -- [[ ---------- Rust ---------- ]]
        dap.configurations.rust = {
            {
                name = "Rust main.rs",
                type = "codelldb",
                request = "launch",
                program = function()
                    -- vim.fn.jobstart("cargo build")
                    os.execute("cargo build")
                    return vim.fn.getcwd() .. '/target/debug/main'
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                showDisassembly = "never",
            },
            {
                name = "Rust enter binary",
                type = "codelldb",
                request = "launch",
                program = function()
                    -- vim.fn.jobstart("cargo build")
                    os.execute("cargo build")
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                showDisassembly = "never",
            },
        }

        -- [[ ---------- UI ---------- ]]
        local dap = require("dap")
        local dapui = require("dapui")
        local daptext = require("nvim-dap-virtual-text")
        local fun = vim.fn

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end

        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end

        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        fun.sign_define("DapBreakpoint", {
            text = "●",
            texthl = "",
            linehl = "debugBreakpoint",
            numhl = "debugBreakpoint",
        })

        fun.sign_define("DapBreakpointCondition", {
            text = "◆",
            texthl = "",
            linehl = "debugBreakpoint",
            numhl = "debugBreakpoint",
        })

        fun.sign_define("DapStopped", {
            text = "▶",
            texthl = "",
            linehl = "debugPC",
            numhl = "debugPC",
        })

        dap.defaults.fallback.force_external_terminal = true

        daptext.setup({})

        dapui.setup({
            controls = {
                element = "console",
                enabled = true,
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
                border = "single",
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
                            size = 0.5,
                        },
                        {
                            id = "stacks",
                            size = 0.5,
                        },
                    },
                    position = "left",
                    size = 40,
                },
                {
                    elements = { {
                        id = "console",
                        size = 1.0,
                    } },
                    position = "bottom",
                    size = 10,
                },
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

        -- [[ ----------- KEYBINDS ---------- ]]
        local dap = require("dap")
        local dapui = require("dapui")
        local defaults = { noremap = true, silent = true, nowait = true }
        local function key(lhs, rhs)
            vim.keymap.set("n", lhs, rhs, defaults)
        end

        key("<leader>dr", function()
            dap.continue()
        end)
        key("<leader>dq", function()
            dap.repl.close()
            dap.terminate()
            dapui.close()
        end)
        key("<leader>db", function()
            dap.toggle_breakpoint()
        end)
        key("<leader>dc", function()
            dap.clear_breakpoints()
        end)
        key("<leader>dn", function()
            dap.step_over()
        end)
        key("<leader>di", function()
            dap.step_into()
        end)
        key("<leader>do", function()
            dap.step_out()
        end)
        key("<leader>dp", function()
            dap.pause()
        end)
        key("<leader>dh", function()
            dap.run_to_cursor()
        end)
    end
}