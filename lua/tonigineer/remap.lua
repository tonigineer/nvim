local map = vim.keymap.set
local M = {}

-- ──── General Keymaps ─────────────────────────────────────────────────────────

map({ "n", "v" }, "<C-s>", ":w!<Return>", { desc = "Save buffer" })
map("i", "<C-s>", "<ESC>:w!<Return>", { desc = "Save buffer" })

map("i", "jk", "<C-[>", { desc = "Quit insert mode" })
map("i", "kj", "<C-[>", { desc = "Quit insert mode" })

map({ "n", "v" }, "<C-a>", "gg<S-v>G", { desc = "Select all" })

map("i", "<C-z>", "<Esc>:u<Return>i", { desc = "Undo" })
map({ "n", "v" }, "<C-z>", ":u<Return>", { desc = "Undo" })
map("i", "<C-y>", "<Esc><C-r>i", { desc = "Redo" })
map({ "n", "v" }, "<C-y>", "<C-r>", { desc = "Redo" })

map("n", "<", "<<", { desc = "Indent left" })
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })
map("n", ">", ">>", { desc = "Indent right" })

map("n", "K", ":move -2<CR>", { desc = "Move line up" })
map("n", "J", ":move +1<CR>", { desc = "Move line down" })
map("v", "K", ":move '<-2<CR>gv=gv", { desc = "Move lines up" })
map("v", "J", ":move '>+1<CR>gv=gv", { desc = "Move lines down" })

-- ──── Todo Comments ───────────────────────────────────────────────────────────

map(
    "n",
    "]t",
    function() require("todo-comments").jump_next() end,
    { desc = "Next todo comment" }
)
map(
    "n",
    "[t",
    function() require("todo-comments").jump_prev() end,
    { desc = "Previous todo comment" }
)

-- ──── Markdown Render Toggle ──────────────────────────────────────────────────

map(
    "n",
    "<leader>tc",
    function()
        require("telescope.builtin").colorscheme({ enable_preview = true })
    end,
    { desc = "Pick colorscheme" }
)

-- ──── Rename With LSP Fallback to Substitute ──────────────────────────────────

map("n", "<leader>r", function()
    local function can_rename()
        local params = vim.lsp.util.make_position_params()
        local responses = vim.lsp.buf_request_sync(
            0,
            "textDocument/prepareRename",
            params,
            500
        )
        if not responses then return false end
        for _, res in pairs(responses) do
            if res.result then return true end
        end
        return false
    end

    local function prefill_substitute()
        local cmd = ":%s/" .. vim.fn.expand("<cword>") .. "/"
        local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
        vim.api.nvim_feedkeys(keys, "n", false)
    end

    if can_rename() then
        vim.lsp.buf.rename()
    else
        prefill_substitute()
    end
end, { desc = "Rename" })

-- ──── Telescope Keymaps (for lazy.nvim keys spec) ─────────────────────────────

M.telescope = {
    {
        "<leader>sh",
        function() require("telescope.builtin").help_tags() end,
        desc = "Search help",
    },
    {
        "<leader>sk",
        function() require("telescope.builtin").keymaps() end,
        desc = "Search keymaps",
    },
    {
        "<leader>sf",
        function() require("telescope.builtin").find_files() end,
        desc = "Search files",
    },
    {
        "<leader>sg",
        function() require("telescope.builtin").live_grep() end,
        desc = "Live grep",
    },
    {
        "<leader><leader>",
        function() require("telescope.builtin").buffers() end,
        desc = "Existing buffers",
    },
    {
        "<leader>/",
        function()
            require("telescope.builtin").current_buffer_fuzzy_find(
                require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                })
            )
        end,
        desc = "Search buffer",
    },
    {
        "<leader>s/",
        function()
            require("telescope.builtin").live_grep({
                grep_open_files = true,
                prompt_title = "Live Grep in Open Files",
            })
        end,
        desc = "Search all buffers",
    },
    {
        "<leader>sn",
        function()
            require("telescope.builtin").find_files({
                cwd = vim.fn.stdpath("config"),
            })
        end,
        desc = "Search nvim config",
    },
}

-- ──── LSP Buffer-local Keymaps (called from LspAttach autocmd) ────────────────

function M.lsp_attach(event)
    require("which-key").add({
        { "<leader>g", group = "Goto" },
        { "<leader>t", group = "Toggles" },
    })

    local bmap = function(keys, func, desc, mode)
        mode = mode or "n"
        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
    end

    bmap("<leader>h", function()
        local opts = {
            focusable = true,
            close_events = {
                "BufLeave",
                "CursorMoved",
                "InsertEnter",
                "FocusLost",
            },
            border = "rounded",
            source = "always",
            prefix = " ",
            scope = "cursor",
        }
        if vim.tbl_isempty(vim.lsp.get_clients()) then return end
        pcall(vim.lsp.buf.hover, opts)
    end, "Show hover")

    bmap("<leader>ga", vim.lsp.buf.code_action, "Code actions", { "n", "x" })
    bmap(
        "<leader>gr",
        function() require("telescope.builtin").lsp_references() end,
        "References"
    )
    bmap(
        "<leader>i",
        function() require("telescope.builtin").lsp_references() end,
        "References"
    )
    bmap(
        "<leader>d",
        function() require("telescope.builtin").lsp_definitions() end,
        "Definition"
    )
    bmap("<leader>gD", vim.lsp.buf.declaration, "Declaration")
    bmap(
        "<leader>gt",
        function() require("telescope.builtin").lsp_type_definitions() end,
        "Type Definition"
    )
    bmap(
        "<leader>D",
        function() require("telescope.builtin").diagnostics() end,
        "List diagnostics"
    )

    bmap(
        "<leader>th",
        function()
            vim.lsp.inlay_hint.enable(
                not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })
            )
        end,
        "Inlay hints"
    )
end

-- ──── Plugin Lazy Key Specs ───────────────────────────────────────────────────

M.conform = {
    {
        "<leader>f",
        function()
            require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        mode = "",
        desc = "Format",
    },
}

M.lazygit = {
    { "<leader>G", "<cmd>LazyGit<cr>", desc = "Lazygit" },
}

M.minifiles = {
    { "<leader>e", "<cmd>lua MiniFiles.open()<cr>", desc = "MiniFiles" },
}

M.markdown = {
    {
        "<leader>tm",
        function()
            require("render-markdown").toggle()
        end,
        desc = "Toggle markdown render",
    },
}

return M
