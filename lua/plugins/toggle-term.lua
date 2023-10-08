return {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",

    config = function()
        local status_ok, toggleterm = pcall(require, "toggleterm")
        if not status_ok then
            return
        end

        toggleterm.setup {
            size = 10,
            open_mapping = [[<c-\>]],
            hide_numbers = true,
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = "float",
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                width = 75,
                height = 15,
                -- winblend = 3,
                border = "curved",
            },
            highlights = {
                -- highlights which map to a highlight group name and a table of it's values
                -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
                Normal = {
                    guibg = "",
                },
                NormalFloat = {
                    link = 'Normal'
                },
                FloatBorder = {
                    guifg = "#3e8fb0",
                    guibg = "",
                },
            },
            -- winbar = {
            --     enabled = false,
            --     name_formatter = function(term) --  term: Terminal
            --       return term.name
            --     end
            --   },
        }

        -- function _G.set_terminal_keymaps()
        --     local opts = { noremap = true }
        --     -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
        --     vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
        --     vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
        --     vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
        --     vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
        -- end

        -- vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new { cmd = "lazygit", hidden = true }

        function _LAZYGIT_TOGGLE()
            lazygit:toggle()
        end
    end
}
