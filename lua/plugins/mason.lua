local M = {
    "williamboman/mason.nvim",
    cmd = "Mason",
    event = "BufReadPre",


}

local settings = {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        width = 0.5,
        height = 0.5
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 10,
}


function M.config()
    require("mason").setup(settings)

    require("mason-lspconfig").setup {
        ensure_installed = {
            "lua_ls"
        },
        automatic_installation = true,
    }

    --   require("mason-nvim-dap").setup({
    --     automatic_installation = true,
    --     -- ensure_installed = { "codelldb", "debugpy" },
    -- })

    require("mason-null-ls").setup({
        automatic_installation = true,
        ensure_installed = {

            "stylua",

        },
    })
end

return M
