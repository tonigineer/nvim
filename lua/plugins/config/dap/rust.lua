local dap = require("dap")

dap.configurations.rust = {
    {
        name = "Rust main.rs",
        type = "codelldb",
        request = "launch",
        program = function()
            vim.fn.jobstart("cargo build")
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
            vim.fn.jobstart("cargo build")
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        showDisassembly = "never",
    },
}