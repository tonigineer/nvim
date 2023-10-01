require("lazy").setup({
    -- plugins
    {
        -- ======================
        --       ESSENTIALS
        -- ======================
        --[[ Auto pair ]]
        { "windwp/nvim-autopairs", event = "InsertEnter" },
        --[[ Auto tags ]]
        { "windwp/nvim-ts-autotag", event = "InsertEnter" },
        --[[ Comments ]]
        { "numToStr/Comment.nvim", opts = {}, lazy = false },
        --[[ Fuzzy finder ]]
        { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
        --[[ Illuminate ]]
        { "RRethy/vim-illuminate" },
        --[[ Statusbar ]]
        { "nvim-lualine/lualine.nvim", dependencies = { "rose-pine/neovim" } },
        --[[ Lsp UI ]]
        { "stevearc/dressing.nvim" },
        --[[ Oil ]]
        { "stevearc/oil.nvim", opts = {}, dependencies = { "nvim-tree/nvim-web-devicons" } },
        --[[ Plenary ]]
        { "nvim-lua/plenary.nvim" },
        --[[ Treesitter ]]
        {
            "nvim-treesitter/nvim-treesitter",
            build = function()
                vim.cmd(":TSUpdate")
            end,
        },

        -- ======================
        --         VANITY
        -- ======================
        --[[ Delimiters ]]
        { "hiphish/rainbow-delimiters.nvim" },
        --[[ Highlight colors ]]
        { "brenoprata10/nvim-highlight-colors" },
        --[[Indent blankline ]]
        { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
        --[[ Noice & Notify ]]
        {
            "folke/noice.nvim",
            event = "VeryLazy",
            opts = {},
            dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
        },
        --[[ Rose Pine theme ]]
        { "rose-pine/neovim" },
        --[[ Startup Screen ]]
        { "startup-nvim/startup.nvim" },

        -- ======================
        --       Completion
        -- ======================
        --[[ Cmp Nvim Lsp ]]
        { "hrsh7th/cmp-nvim-lsp" },
        --[[ Cmp Buffer ]]
        { "hrsh7th/cmp-buffer" },
        --[[ Cmp Path ]]
        { "hrsh7th/cmp-path" },
        --[[ Cmp Commandline ]]
        { "hrsh7th/cmp-cmdline" },
        --[[ Cmp ]]
        { "hrsh7th/nvim-cmp" },
        --[[ Lua Snip ]]
        { "L3MON4D3/LuaSnip" },
        --[[ Cmp Lua Snip ]]
        { "saadparwaiz1/cmp_luasnip" },
        --[[ Friend. Snippets ]]
        { "rafamadriz/friendly-snippets" },

        -- ==================
        --  Language Servers
        -- ==================
        --[[ Mason ]]
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim", dependencies = { { "neovim/nvim-lspconfig" } } },
        {
            "jay-babu/mason-null-ls.nvim",
            event = "VeryLazy",
            dependencies = { { "jose-elias-alvarez/null-ls.nvim" } },
        },
        --[[ Rust ]]
        { "simrat39/rust-tools.nvim" },
        --[[ Rust Crates ]]
        { "Saecki/crates.nvim" },
        --[[ C++ / C ]]
        { "p00f/clangd_extensions.nvim" },

        -- ==================
        --      Debugging
        -- ==================
        --[[ Adapter ]]
        {
            "jay-babu/mason-nvim-dap.nvim",
            event = "VeryLazy",
            opts = { handlers = {} },
            dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
        },
        --[[ Ui ]]
        { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
        --[[ Inline Hints ]]
        { "theHamsta/nvim-dap-virtual-text" },
        --[[ REPL Cmp ]]
        { "rcarriga/cmp-dap" },
        --[[ REPL Highlig.]]
        { "LiadOz/nvim-dap-repl-highlights" },

        -- ==================
        --      Linting
        -- ==================
        --[[ Nvim Lint ]]
        { "mfussenegger/nvim-lint", event = { "BufReadPre", "BufNewFile" } },
    },
    -- options
    {},
})

require("plugins.config")
