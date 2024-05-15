return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            -- local builtin = require("telescope.builtin")
            -- vim.keymap.set("n", "<C-p>", builtin.find_files, {})
            -- vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            -- vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

            local wk = require("which-key")
            wk.register({
                ["<leader>f"] = { name = "+Telescope" },
                ["<leader>ff"] = {
                    "<cmd>Telescope find_files<cr>",
                    "Find File",
                },
                ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "Live grep" },
                ["<leader>fr"] = {
                    "<cmd>Telescope oldfiles<cr>",
                    "Open Recent File",
                },
                ["<leader>fn"] = { "<cmd>enew<cr>", "New File" },
            })

            require("telescope").load_extension("ui-select")
        end,
    },
}
