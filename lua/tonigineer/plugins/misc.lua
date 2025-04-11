return {
    { -- Collection of various small independent plugins/modules
        "echasnovski/mini.nvim",
        config = function()
            -- Better Around/Inside textobjects
            --
            -- Examples:
            --  - va)  - [V]isually select [A]round [)]paren
            --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
            --  - ci'  - [C]hange [I]nside [']quote
            require("mini.ai").setup({ n_lines = 500 })

            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            --
            -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
            -- - sd'   - [S]urround [D]elete [']quotes
            -- - sr)'  - [S]urround [R]eplace [)] [']
            require("mini.surround").setup()

            -- Simple and easy statusline.
            --  You could remove this setup call if you don't like it,
            --  and try some other statusline plugin
            -- local statusline = require("mini.statusline")
            -- set use_icons to true if you have a Nerd Font
            -- statusline.setup({ use_icons = vim.g.have_nerd_font })

            -- You can configure sections in the statusline by overriding their
            -- default behavior. For example, here we set the section for
            -- cursor location to LINE:COLUMN
            ---@diagnostic disable-next-line: duplicate-set-field
            -- statusline.section_location = function() return "%2l:%-2v" end

            -- ... and there is more!
            --  Check out: https://github.com/echasnovski/mini.nvim
        end,
    },

    {
        "echasnovski/mini.comment",
        lazy = false,
        event = "BufReadPre",
        config = function()
            -- No need to copy this inside `setup()`. Will be used automatically.
            -- Options which control module behavior
            require("mini.comment").setup({
                -- Options which control module behavior
                options = {
                    -- Function to compute custom 'commentstring' (optional)
                    custom_commentstring = nil,
                    -- Whether to ignore blank lines when commenting
                    ignore_blank_line = false,
                    -- Whether to recognize as comment only lines without indent
                    start_of_line = false,
                    -- Whether to force single space inner padding for comment parts
                    pad_comment_parts = true,
                },
                -- Module mappings. Use `''` (empty string) to disable one.
                mappings = {
                    -- Toggle comment (like `gcip` - comment inner paragraph) for both
                    -- Normal and Visual modes
                    comment = "<c-/>",
                    -- Toggle comment on current line
                    comment_line = "<c-/>",
                    -- Toggle comment on visual selection
                    comment_visual = "<c-/>",
                    -- Define 'comment' textobject (like `dgc` - delete whole comment block)
                    -- Works also in Visual mode if mapping differs from `comment_visual`
                    textobject = "<c-/>",
                },
                -- -- Hook functions to be executed at certain stage of commenting
                hooks = {
                    -- Before successful commenting. Does nothing by default.
                    pre = function() end,
                    -- After successful commenting. Does nothing by default.
                    post = function() end,
                },
            })
        end,
    },

    -- (Neo)vim syntax highlighting for Kitty terminal configuration and session files.
    {
        "fladson/vim-kitty",
        ft = "kitty",
    },

    {
        "brenoprata10/nvim-highlight-colors",
        config = function()
            require("nvim-highlight-colors").setup({
                ---Render style
                ---@usage 'background'|'foreground'|'virtual'
                render = "background",

                ---Set virtual symbol (requires render to be set to 'virtual')
                virtual_symbol = "■",

                ---Highlight named colors, e.g. 'green'
                enable_named_colors = true,

                ---Highlight tailwind colors, e.g. 'bg-blue-500'
                enable_tailwind = false,

                ---Set custom colors
                ---Label must be properly escaped with '%' to adhere to `string.gmatch`
                --- :help string.gmatch
                custom_colors = {
                    { label = "%-%-theme%-primary%-color", color = "#0f1219" },
                    {
                        label = "%-%-theme%-secondary%-color",
                        color = "#5a5d64",
                    },
                },
            })
        end,
    },

    {
        "machakann/vim-highlightedyank",
        event = "BufReadPre",
    },

    -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
    -- {
    --     "folke/noice.nvim",
    --     event = "VeryLazy",
    --     opts = {
    --         -- add any options here
    --     },
    --     dependencies = {
    --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim",
    --         -- OPTIONAL:
    --         --   `nvim-notify` is only needed, if you want to use the notification view.
    --         --   If not available, we use `mini` as the fallback
    --         "rcarriga/nvim-notify",
    --     },
    -- },
}
