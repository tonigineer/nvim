require("lazy").setup {
    -- plugins
    {
    -- ======================
    --       ESSENTIALS
    -- ======================
        --[[ Auto pair ]]       { "windwp/nvim-autopairs", event = "InsertEnter" },
        --[[ Auto tags ]]       { "windwp/nvim-ts-autotag", event = "InsertEnter" },
        --[[ Comments ]]        { "numToStr/Comment.nvim", opts = {}, lazy = false },
        --[[ Fuzzy finder ]]    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
        --[[ Illuminate ]]      { "RRethy/vim-illuminate" },
        --[[ Statusbar ]]       { "nvim-lualine/lualine.nvim", dependencies = { "rose-pine/neovim"} },
        --[[ Lsp UI ]]          { "stevearc/dressing.nvim" }, 
        --[[ Oil ]]             { "stevearc/oil.nvim", opts = {}, dependencies = { "nvim-tree/nvim-web-devicons" } },
        --[[ Plenary ]]         { "nvim-lua/plenary.nvim" },
        --[[ Treesitter ]]      { "nvim-treesitter/nvim-treesitter", build = function () vim.cmd(":TSUpdate") end },

    -- ======================
    --         VANITY
    -- ======================
        --[[ Rose Pine theme ]] { "rose-pine/neovim" },
        --[[ Highlight colors ]]{ "brenoprata10/nvim-highlight-colors" },
        --[[ Indent blankline ]]{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    },
    -- options
    {
    }
}

require("plugins.config")

