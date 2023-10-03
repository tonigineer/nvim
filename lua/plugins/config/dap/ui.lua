local dap, dapui = require("dap"), require("dapui")
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
        element = "repl",
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
                id = "repl",
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

