-- ——— LSP component ———————————————————————————————————————————————————————————
local function lsp_clients()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients == 0 then return "No LSP" end
    local names = vim.tbl_map(function(client) return client.name end, clients)
    return table.concat(names, ", ")
end

return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
        vim.g.lualine_laststatus = vim.o.laststatus
        if vim.fn.argc(-1) > 0 then
            vim.o.statusline = " "
        else
            vim.o.laststatus = 0
        end
    end,
    opts = {
        options = {
            theme = "auto",
            globalstatus = true,
            disabled_filetypes = {
                statusline = { "dashboard", "alpha", "starter" },
            },
        },
        sections = {
            lualine_c = {
                "%=",
                { lsp_clients, icon = " LSP:" },
            },
        },
    },
}
