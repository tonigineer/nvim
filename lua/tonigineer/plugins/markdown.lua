return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    keys = require("tonigineer.remap").markdown,
    opts = {
        completions = { blink = { enabled = true } },
        heading = {
            enabled = true,
            atx = true,
            setext = true,
            sign = true,
            icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
            position = "overlay",
            signs = { "󰫎 " },
            width = "full",
            left_margin = 0,
            left_pad = 0,
            right_pad = 0,
            min_width = 0,
            border = false,
            border_virtual = false,
            border_prefix = false,
            above = "▄",
            below = "▀",
            backgrounds = {
                "RenderMarkdownH1Bg",
                "RenderMarkdownH2Bg",
                "RenderMarkdownH3Bg",
                "RenderMarkdownH4Bg",
                "RenderMarkdownH5Bg",
                "RenderMarkdownH6Bg",
            },
            foregrounds = {
                "RenderMarkdownH1",
                "RenderMarkdownH2",
                "RenderMarkdownH3",
                "RenderMarkdownH4",
                "RenderMarkdownH5",
                "RenderMarkdownH6",
            },
        },
        paragraph = {
            enabled = true,
            left_margin = 0,
            indent = 0,
            min_width = 0,
        },
        code = {
            enabled = true,
            sign = true,
            style = "full",
            position = "left",
            language_pad = 0,
            language_icon = true,
            language_name = true,
            language_info = true,
            disable_background = { "diff" },
            width = "full",
            left_margin = 0,
            left_pad = 0,
            right_pad = 0,
            min_width = 0,
            border = "hide",
            language_border = "█",
            language_left = "",
            language_right = "",
            above = "▄",
            below = "▀",
            inline_left = "",
            inline_right = "",
            inline_pad = 0,
            highlight = "RenderMarkdownCode",
            highlight_info = "RenderMarkdownCodeInfo",
            highlight_language = nil,
            highlight_border = "RenderMarkdownCodeBorder",
            highlight_fallback = "RenderMarkdownCodeFallback",
            highlight_inline = "RenderMarkdownCodeInline",
        },
        dash = {
            enabled = true,
            icon = "─",
            width = "full",
            left_margin = 0,
            highlight = "RenderMarkdownDash",
        },
        bullet = {
            enabled = true,
            icons = { "●", "○", "◆", "◇" },
            ordered_icons = function(ctx)
                local value = vim.trim(ctx.value)
                local index = tonumber(value:sub(1, #value - 1))
                return ("%d."):format(index > 1 and index or ctx.index)
            end,
            left_pad = 0,
            right_pad = 0,
            highlight = "RenderMarkdownBullet",
            scope_highlight = {},
        },
        checkbox = {
            enabled = true,
            bullet = false,
            right_pad = 1,
            unchecked = {
                icon = "󰄱 ",
                highlight = "RenderMarkdownUnchecked",
                scope_highlight = nil,
            },
            checked = {
                icon = "󰱒 ",
                highlight = "RenderMarkdownChecked",
                scope_highlight = nil,
            },
            custom = {
                todo = {
                    raw = "[-]",
                    rendered = "󰥔 ",
                    highlight = "RenderMarkdownTodo",
                    scope_highlight = nil,
                },
            },
        },
        quote = {
            enabled = true,
            icon = "▋",
            repeat_linebreak = false,
            highlight = {
                "RenderMarkdownQuote1",
                "RenderMarkdownQuote2",
                "RenderMarkdownQuote3",
                "RenderMarkdownQuote4",
                "RenderMarkdownQuote5",
                "RenderMarkdownQuote6",
            },
        },
        pipe_table = {
            enabled = true,
            preset = "none",
            style = "full",
            cell = "padded",
            padding = 1,
            min_width = 0,
            border = {
                "┌", "┬", "┐",
                "├", "┼", "┤",
                "└", "┴", "┘",
                "│", "─",
            },
            border_virtual = false,
            alignment_indicator = "━",
            head = "RenderMarkdownTableHead",
            row = "RenderMarkdownTableRow",
            filler = "RenderMarkdownTableFill",
        },
        callout = {
            note       = { raw = "[!NOTE]",      rendered = "󰋽 Note",      highlight = "RenderMarkdownInfo",    category = "github" },
            tip        = { raw = "[!TIP]",       rendered = "󰌶 Tip",       highlight = "RenderMarkdownSuccess", category = "github" },
            important  = { raw = "[!IMPORTANT]", rendered = "󰅾 Important", highlight = "RenderMarkdownHint",    category = "github" },
            warning    = { raw = "[!WARNING]",   rendered = "󰀪 Warning",   highlight = "RenderMarkdownWarn",    category = "github" },
            caution    = { raw = "[!CAUTION]",   rendered = "󰳦 Caution",   highlight = "RenderMarkdownError",   category = "github" },
            abstract   = { raw = "[!ABSTRACT]",  rendered = "󰨸 Abstract",  highlight = "RenderMarkdownInfo",    category = "obsidian" },
            summary    = { raw = "[!SUMMARY]",   rendered = "󰨸 Summary",   highlight = "RenderMarkdownInfo",    category = "obsidian" },
            tldr       = { raw = "[!TLDR]",      rendered = "󰨸 Tldr",      highlight = "RenderMarkdownInfo",    category = "obsidian" },
            info       = { raw = "[!INFO]",      rendered = "󰋽 Info",      highlight = "RenderMarkdownInfo",    category = "obsidian" },
            todo       = { raw = "[!TODO]",      rendered = "󰗡 Todo",      highlight = "RenderMarkdownInfo",    category = "obsidian" },
            hint       = { raw = "[!HINT]",      rendered = "󰌶 Hint",      highlight = "RenderMarkdownSuccess", category = "obsidian" },
            success    = { raw = "[!SUCCESS]",   rendered = "󰄬 Success",   highlight = "RenderMarkdownSuccess", category = "obsidian" },
            check      = { raw = "[!CHECK]",     rendered = "󰄬 Check",     highlight = "RenderMarkdownSuccess", category = "obsidian" },
            done       = { raw = "[!DONE]",      rendered = "󰄬 Done",      highlight = "RenderMarkdownSuccess", category = "obsidian" },
            question   = { raw = "[!QUESTION]",  rendered = "󰘥 Question",  highlight = "RenderMarkdownWarn",    category = "obsidian" },
            help       = { raw = "[!HELP]",      rendered = "󰘥 Help",      highlight = "RenderMarkdownWarn",    category = "obsidian" },
            faq        = { raw = "[!FAQ]",       rendered = "󰘥 Faq",       highlight = "RenderMarkdownWarn",    category = "obsidian" },
            attention  = { raw = "[!ATTENTION]", rendered = "󰀪 Attention", highlight = "RenderMarkdownWarn",    category = "obsidian" },
            failure    = { raw = "[!FAILURE]",   rendered = "󰅖 Failure",   highlight = "RenderMarkdownError",   category = "obsidian" },
            fail       = { raw = "[!FAIL]",      rendered = "󰅖 Fail",      highlight = "RenderMarkdownError",   category = "obsidian" },
            missing    = { raw = "[!MISSING]",   rendered = "󰅖 Missing",   highlight = "RenderMarkdownError",   category = "obsidian" },
            danger     = { raw = "[!DANGER]",    rendered = "󱐌 Danger",    highlight = "RenderMarkdownError",   category = "obsidian" },
            error      = { raw = "[!ERROR]",     rendered = "󱐌 Error",     highlight = "RenderMarkdownError",   category = "obsidian" },
            bug        = { raw = "[!BUG]",       rendered = "󰨰 Bug",       highlight = "RenderMarkdownError",   category = "obsidian" },
            example    = { raw = "[!EXAMPLE]",   rendered = "󰉹 Example",   highlight = "RenderMarkdownHint",    category = "obsidian" },
            quote      = { raw = "[!QUOTE]",     rendered = "󱆨 Quote",     highlight = "RenderMarkdownQuote",   category = "obsidian" },
            cite       = { raw = "[!CITE]",      rendered = "󱆨 Cite",      highlight = "RenderMarkdownQuote",   category = "obsidian" },
        },
        link = {
            enabled = true,
            footnote = {
                enabled = true,
                superscript = true,
                prefix = "",
                suffix = "",
            },
            image = "󰥶 ",
            email = "󰀓 ",
            hyperlink = "󰌹 ",
            highlight = "RenderMarkdownLink",
            wiki = {
                icon = "󱗖 ",
                body = function() return nil end,
                highlight = "RenderMarkdownWikiLink",
            },
            custom = {
                web           = { pattern = "^http",              icon = "󰖟 " },
                discord       = { pattern = "discord%.com",       icon = "󰙯 " },
                github        = { pattern = "github%.com",        icon = "󰊤 " },
                gitlab        = { pattern = "gitlab%.com",        icon = "󰮠 " },
                google        = { pattern = "google%.com",        icon = "󰊭 " },
                neovim        = { pattern = "neovim%.io",         icon = " " },
                reddit        = { pattern = "reddit%.com",        icon = "󰑍 " },
                stackoverflow = { pattern = "stackoverflow%.com", icon = "󰓌 " },
                wikipedia     = { pattern = "wikipedia%.org",     icon = "󰖬 " },
                youtube       = { pattern = "youtube%.com",       icon = "󰗃 " },
            },
        },
        sign = {
            enabled = true,
            highlight = "RenderMarkdownSign",
        },
        indent = {
            enabled = false,
            per_level = 2,
            skip_level = 1,
            skip_heading = false,
            icon = "▎",
            priority = 0,
            highlight = "RenderMarkdownIndent",
        },
    },
    config = function(_, opts)
        require("render-markdown").setup(opts)

        local map = vim.api.nvim_set_hl

        -- ──── Heading Foregrounds ───────────────────────────────────────────────────

        map(0, "RenderMarkdownH1", { fg = "#E5E5E5", bold = true })
        map(0, "RenderMarkdownH2", { fg = "#D0D0D0", bold = true })
        map(0, "RenderMarkdownH3", { fg = "#B8B8B8", bold = true })
        map(0, "RenderMarkdownH4", { fg = "#A0A0A0", bold = true })
        map(0, "RenderMarkdownH5", { fg = "#888888", bold = true })
        map(0, "RenderMarkdownH6", { fg = "#707070", bold = true })

        -- ──── Heading Backgrounds ───────────────────────────────────────────────────

        map(0, "RenderMarkdownH1Bg", { bg = "#2A2A2A" })
        map(0, "RenderMarkdownH2Bg", { bg = "#242424" })
        map(0, "RenderMarkdownH3Bg", { bg = "#1E1E1E" })
        map(0, "RenderMarkdownH4Bg", { bg = "#1A1A1A" })
        map(0, "RenderMarkdownH5Bg", { bg = "#161616" })
        map(0, "RenderMarkdownH6Bg", { bg = "#121212" })
    end,
}
