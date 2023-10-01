local dap = require("dap")
local dapui = require("dapui")
local daptext = require("nvim-dap-virtual-text")
local fun = vim.fn

local function adapter(name)
    return require("plugins.config.dap."..name)
end

adapter("clang")
adapter("rust")
adapter("ui")

fun.sign_define (
    "DapBreakpoint",
    {
        text =        "●",
        texthl =    "",
        linehl =    "debugBreakpoint",
        numhl =        "debugBreakpoint"
    }
)

fun.sign_define (
    "DapBreakpointCondition",
    {
        text =        "◆",
        texthl =    "",
        linehl =    "debugBreakpoint",
        numhl =        "debugBreakpoint"
    }
)

fun.sign_define (
    "DapStopped",
    {
        text = "▶",
        texthl = "",
        linehl = "debugPC",
        numhl = "debugPC"
    }
)

dap.defaults.fallback.force_external_terminal = true

daptext.setup {}

dapui.setup {
    layouts = {
        {
            elements = {
                {
                    id = "watches",
                    size = 0.33
                },
                {
                    id = "scopes",
                    size = 0.33
                },
                {
                    id = "repl",
                    size = 0.34
                }
            },
            size = 40,
            position = "left"
        },
        {
            elements = {
                "console"
            },
            size = 0.25,
            position = "bottom"
        }
    },
    controls = {
        enabled = true,
        element = "repl",
        icons = {
            pause = "",
            play = "",
            step_into = "",
            step_over = "",
            step_out = "",
            step_back = "",
            run_last = "",
            terminate = "",
        }
    }
}

local rt = require("rust-tools")

-- local mason_registry = require("mason-registry")

-- local codelldb = mason_registry.get_package("codelldb")
-- local extension_path = codelldb:get_install_path() .. "/extension/"
-- local codelldb_path = extension_path .. "adapter/codelldb"
-- local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"


-- local mason_registry = require("mason-registry")

-- local codelldb = mason_registry.get_package("codelldb")
-- -- local extension_path = codelldb:get_install_path() .. "/extension/"
-- -- local codelldb_path = extension_path .. "adapter/codelldb"

-- local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
-- local codelldb_adapter = {
--   type = "server",
--   port = "${port}",
--   executable = {
--     command = mason_path .. "bin/codelldb",
--     args = { "--port", "${port}" },
--     -- On windows you may have to uncomment this:
--     -- detached = false,
--   },
-- }
