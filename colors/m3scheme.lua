-- Reset highlighting.
vim.cmd.highlight("clear")
if vim.fn.exists("syntax_on") then vim.cmd.syntax("reset") end

vim.o.termguicolors = true
vim.g.colors_name = "m3scheme"

-- Function to read the JSON file using Neovim's built-in parser
local function read_json_file(filepath)
    local expanded_path = vim.fn.expand(filepath)

    if vim.fn.filereadable(expanded_path) == 0 then
        vim.notify(
            "m3scheme: JSON file not found at " .. expanded_path,
            vim.log.levels.ERROR
        )
        return nil
    end

    local content = vim.fn.readfile(expanded_path)
    local json_string = table.concat(content, "")

    if json_string == "" then
        vim.notify("m3scheme: JSON file is empty.", vim.log.levels.ERROR)
        return nil
    end

    local ok, result = pcall(vim.fn.json_decode, json_string)
    if not ok then
        vim.notify(
            "m3scheme: Failed to parse JSON. Error: " .. tostring(result),
            vim.log.levels.ERROR
        )
        return nil
    end

    return result
end

-- Helper function to ensure color has # prefix
local function ensure_hex(color)
    if color and type(color) == "string" and not color:match("^#") then
        return "#" .. color
    end
    return color
end

-- Helper function to set highlight groups
local function set_hl(group, opts) vim.api.nvim_set_hl(0, group, opts) end

-- Main function to apply the colorscheme
local function apply_colors()
    local scheme_path = "~/.local/state/caelestia/scheme.json"
    local scheme_data = read_json_file(scheme_path)

    if not scheme_data or not scheme_data.colours then
        vim.notify(
            "m3scheme: Aborting. Invalid data from scheme.json.",
            vim.log.levels.ERROR
        )
        return
    end

    local colors = scheme_data.colours

    for key, value in pairs(colors) do
        colors[key] = ensure_hex(value)
    end

    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end

    -- Set terminal colors if available
    if colors.term0 then
        for i = 0, 15 do
            local term_color = colors["term" .. i]
            if term_color then vim.g["terminal_color_" .. i] = term_color end
        end
    end

    -- Base highlights
    set_hl("Normal", {
        fg = colors.text or colors.onBackground,
        bg = colors.base or colors.background,
    })
    set_hl(
        "NormalFloat",
        { fg = colors.text or colors.onSurface, bg = colors.surface }
    )
    set_hl("FloatBorder", { fg = colors.outline, bg = colors.surface })
    set_hl("NormalNC", {
        fg = colors.text or colors.onBackground,
        bg = colors.base or colors.background,
    })

    -- Cursor and selection
    set_hl(
        "Cursor",
        { fg = colors.base or colors.background, bg = colors.primary }
    )
    set_hl("CursorLine", { bg = colors.surface0 or colors.surfaceContainerLow })
    set_hl(
        "CursorColumn",
        { bg = colors.surface0 or colors.surfaceContainerLow }
    )
    set_hl(
        "ColorColumn",
        { bg = colors.surface0 or colors.surfaceContainerLow }
    )
    set_hl("Visual", { bg = colors.surface1 or colors.surfaceContainer })
    set_hl("VisualNOS", { bg = colors.surface1 or colors.surfaceContainer })
    set_hl("Search", {
        fg = colors.base or colors.background,
        bg = colors.yellow or colors.tertiary,
    })
    set_hl("IncSearch", {
        fg = colors.base or colors.background,
        bg = colors.peach or colors.primary,
    })
    set_hl("CurSearch", {
        fg = colors.base or colors.background,
        bg = colors.peach or colors.primary,
    })

    -- Line numbers
    set_hl("LineNr", { fg = colors.overlay0 or colors.outline })
    set_hl("CursorLineNr", { fg = colors.primary, bold = true })
    set_hl("SignColumn", {
        fg = colors.surface1 or colors.surfaceContainer,
        bg = colors.base or colors.background,
    })
    set_hl("FoldColumn", {
        fg = colors.overlay0 or colors.outline,
        bg = colors.base or colors.background,
    })

    -- Syntax highlighting
    set_hl(
        "Comment",
        { fg = colors.overlay2 or colors.outlineVariant, italic = true }
    )
    set_hl("String", { fg = colors.green or colors.tertiary })
    set_hl("Character", { fg = colors.green or colors.tertiary })
    set_hl("Number", { fg = colors.peach or colors.secondary })
    set_hl("Boolean", { fg = colors.peach or colors.secondary })
    set_hl("Float", { fg = colors.peach or colors.secondary })
    set_hl("Identifier", { fg = colors.text or colors.onSurface })
    set_hl("Function", { fg = colors.blue or colors.primary })
    set_hl("Statement", { fg = colors.mauve or colors.secondary })
    set_hl("Conditional", { fg = colors.mauve or colors.secondary })
    set_hl("Repeat", { fg = colors.mauve or colors.secondary })
    set_hl("Label", { fg = colors.sapphire or colors.tertiary })
    set_hl("Operator", { fg = colors.sky or colors.primary })
    set_hl("Keyword", { fg = colors.mauve or colors.secondary })
    set_hl("Exception", { fg = colors.mauve or colors.secondary })
    set_hl("PreProc", { fg = colors.pink or colors.primary })
    set_hl("Include", { fg = colors.pink or colors.primary })
    set_hl("Define", { fg = colors.pink or colors.primary })
    set_hl("Macro", { fg = colors.pink or colors.primary })
    set_hl("PreCondit", { fg = colors.pink or colors.primary })
    set_hl("Type", { fg = colors.yellow or colors.tertiary })
    set_hl("StorageClass", { fg = colors.yellow or colors.tertiary })
    set_hl("Structure", { fg = colors.yellow or colors.tertiary })
    set_hl("Typedef", { fg = colors.yellow or colors.tertiary })
    set_hl("Special", { fg = colors.blue or colors.primary })
    set_hl("SpecialChar", { fg = colors.maroon or colors.secondary })
    set_hl("Tag", { fg = colors.mauve or colors.secondary })
    set_hl("Delimiter", { fg = colors.overlay2 or colors.outlineVariant })
    set_hl("SpecialComment", { fg = colors.overlay2 or colors.outlineVariant })
    set_hl("Debug", { fg = colors.overlay2 or colors.outlineVariant })
    set_hl(
        "Underlined",
        { fg = colors.blue or colors.primary, underline = true }
    )
    set_hl("Ignore", { fg = colors.overlay0 or colors.outline })
    set_hl("Error", { fg = colors.error })
    set_hl("Todo", {
        fg = colors.base or colors.background,
        bg = colors.yellow or colors.tertiary,
    })

    -- Diff colors
    set_hl("DiffAdd", { fg = colors.success, bg = colors.successContainer })
    set_hl("DiffChange", {
        fg = colors.blue or colors.primary,
        bg = colors.surface1 or colors.surfaceContainer,
    })
    set_hl("DiffDelete", { fg = colors.error, bg = colors.errorContainer })
    set_hl("DiffText", {
        fg = colors.blue or colors.primary,
        bg = colors.surface2 or colors.surfaceContainerHigh,
    })

    -- Git signs
    set_hl("GitSignsAdd", { fg = colors.success })
    set_hl("GitSignsChange", { fg = colors.blue or colors.primary })
    set_hl("GitSignsDelete", { fg = colors.error })

    -- Statusline
    set_hl(
        "StatusLine",
        { fg = colors.text or colors.onSurface, bg = colors.surface }
    )
    set_hl(
        "StatusLineNC",
        { fg = colors.overlay1 or colors.outline, bg = colors.surface }
    )
    set_hl("WinSeparator", { fg = colors.outline })

    -- Tabline
    set_hl(
        "TabLine",
        { fg = colors.overlay1 or colors.outline, bg = colors.surface }
    )
    set_hl(
        "TabLineFill",
        { fg = colors.overlay1 or colors.outline, bg = colors.surface }
    )
    set_hl("TabLineSel", {
        fg = colors.text or colors.onSurface,
        bg = colors.surface1 or colors.surfaceContainer,
    })

    -- Popup menu
    set_hl(
        "Pmenu",
        { fg = colors.text or colors.onSurface, bg = colors.surface }
    )
    set_hl(
        "PmenuSel",
        { fg = colors.base or colors.background, bg = colors.primary }
    )
    set_hl("PmenuSbar", { bg = colors.surface1 or colors.surfaceContainer })
    set_hl("PmenuThumb", { bg = colors.overlay0 or colors.outline })

    -- LSP and diagnostics
    set_hl("DiagnosticError", { fg = colors.error })
    set_hl("DiagnosticWarn", { fg = colors.peach or colors.secondary })
    set_hl("DiagnosticInfo", { fg = colors.blue or colors.primary })
    set_hl("DiagnosticHint", { fg = colors.teal or colors.tertiary })
    set_hl("DiagnosticOk", { fg = colors.success })

    set_hl("DiagnosticVirtualTextError", {
        fg = colors.error,
        bg = colors.surface0 or colors.surfaceContainerLow,
    })
    set_hl("DiagnosticVirtualTextWarn", {
        fg = colors.peach or colors.secondary,
        bg = colors.surface0 or colors.surfaceContainerLow,
    })
    set_hl("DiagnosticVirtualTextInfo", {
        fg = colors.blue or colors.primary,
        bg = colors.surface0 or colors.surfaceContainerLow,
    })
    set_hl("DiagnosticVirtualTextHint", {
        fg = colors.teal or colors.tertiary,
        bg = colors.surface0 or colors.surfaceContainerLow,
    })
    set_hl("DiagnosticVirtualTextOk", {
        fg = colors.success,
        bg = colors.surface0 or colors.surfaceContainerLow,
    })

    set_hl("DiagnosticUnderlineError", { undercurl = true, sp = colors.error })
    set_hl(
        "DiagnosticUnderlineWarn",
        { undercurl = true, sp = colors.peach or colors.secondary }
    )
    set_hl(
        "DiagnosticUnderlineInfo",
        { undercurl = true, sp = colors.blue or colors.primary }
    )
    set_hl(
        "DiagnosticUnderlineHint",
        { undercurl = true, sp = colors.teal or colors.tertiary }
    )
    set_hl("DiagnosticUnderlineOk", { undercurl = true, sp = colors.success })

    -- LSP references
    set_hl(
        "LspReferenceText",
        { bg = colors.surface1 or colors.surfaceContainer }
    )
    set_hl(
        "LspReferenceRead",
        { bg = colors.surface1 or colors.surfaceContainer }
    )
    set_hl(
        "LspReferenceWrite",
        { bg = colors.surface1 or colors.surfaceContainer }
    )

    -- Treesitter highlights (using fallback colors when specific ones aren't available)
    set_hl("@variable", { fg = colors.text or colors.onSurface })
    set_hl("@variable.builtin", { fg = colors.red or colors.error })
    set_hl("@variable.parameter", { fg = colors.maroon or colors.secondary })
    set_hl("@variable.member", { fg = colors.blue or colors.primary })
    set_hl("@constant", { fg = colors.peach or colors.secondary })
    set_hl("@constant.builtin", { fg = colors.peach or colors.secondary })
    set_hl("@constant.macro", { fg = colors.peach or colors.secondary })
    set_hl("@module", { fg = colors.blue or colors.primary })
    set_hl("@label", { fg = colors.sapphire or colors.tertiary })
    set_hl("@string", { fg = colors.green or colors.tertiary })
    set_hl("@string.documentation", { fg = colors.green or colors.tertiary })
    set_hl("@string.regexp", { fg = colors.peach or colors.secondary })
    set_hl("@string.escape", { fg = colors.pink or colors.primary })
    set_hl("@character", { fg = colors.green or colors.tertiary })
    set_hl("@character.special", { fg = colors.pink or colors.primary })
    set_hl("@number", { fg = colors.peach or colors.secondary })
    set_hl("@number.float", { fg = colors.peach or colors.secondary })
    set_hl("@boolean", { fg = colors.peach or colors.secondary })
    set_hl("@annotation", { fg = colors.yellow or colors.tertiary })
    set_hl("@attribute", { fg = colors.yellow or colors.tertiary })
    set_hl("@error", { fg = colors.error })

    -- Functions
    set_hl("@function", { fg = colors.blue or colors.primary })
    set_hl("@function.builtin", { fg = colors.peach or colors.secondary })
    set_hl("@function.call", { fg = colors.blue or colors.primary })
    set_hl("@function.macro", { fg = colors.peach or colors.secondary })
    set_hl("@function.method", { fg = colors.blue or colors.primary })
    set_hl("@function.method.call", { fg = colors.blue or colors.primary })
    set_hl("@constructor", { fg = colors.sapphire or colors.tertiary })
    set_hl("@operator", { fg = colors.sky or colors.primary })

    -- Keywords
    set_hl("@keyword", { fg = colors.mauve or colors.secondary })
    set_hl("@keyword.function", { fg = colors.mauve or colors.secondary })
    set_hl("@keyword.operator", { fg = colors.mauve or colors.secondary })
    set_hl("@keyword.return", { fg = colors.mauve or colors.secondary })
    set_hl("@keyword.conditional", { fg = colors.mauve or colors.secondary })
    set_hl("@keyword.repeat", { fg = colors.mauve or colors.secondary })
    set_hl("@keyword.exception", { fg = colors.mauve or colors.secondary })
    set_hl("@keyword.import", { fg = colors.pink or colors.primary })
    set_hl("@keyword.storage", { fg = colors.yellow or colors.tertiary })
    set_hl("@keyword.directive", { fg = colors.pink or colors.primary })
    set_hl("@keyword.directive.define", { fg = colors.pink or colors.primary })

    -- Types
    set_hl("@type", { fg = colors.yellow or colors.tertiary })
    set_hl("@type.builtin", { fg = colors.yellow or colors.tertiary })
    set_hl("@type.definition", { fg = colors.yellow or colors.tertiary })
    set_hl("@type.qualifier", { fg = colors.yellow or colors.tertiary })

    -- Punctuation
    set_hl(
        "@punctuation.delimiter",
        { fg = colors.overlay2 or colors.outlineVariant }
    )
    set_hl(
        "@punctuation.bracket",
        { fg = colors.overlay2 or colors.outlineVariant }
    )
    set_hl("@punctuation.special", { fg = colors.sky or colors.primary })

    -- Comments
    set_hl(
        "@comment",
        { fg = colors.overlay2 or colors.outlineVariant, italic = true }
    )
    set_hl(
        "@comment.documentation",
        { fg = colors.overlay2 or colors.outlineVariant }
    )
    set_hl("@comment.error", { fg = colors.error })
    set_hl("@comment.warning", { fg = colors.peach or colors.secondary })
    set_hl("@comment.note", { fg = colors.blue or colors.primary })
    set_hl("@comment.todo", {
        fg = colors.base or colors.background,
        bg = colors.yellow or colors.tertiary,
    })

    -- Markup (for markdown, etc.)
    set_hl(
        "@markup.strong",
        { fg = colors.maroon or colors.secondary, bold = true }
    )
    set_hl(
        "@markup.emphasis",
        { fg = colors.maroon or colors.secondary, italic = true }
    )
    set_hl(
        "@markup.underline",
        { fg = colors.text or colors.onSurface, underline = true }
    )
    set_hl(
        "@markup.strike",
        { fg = colors.text or colors.onSurface, strikethrough = true }
    )
    set_hl(
        "@markup.heading",
        { fg = colors.blue or colors.primary, bold = true }
    )
    set_hl(
        "@markup.heading.1",
        { fg = colors.blue or colors.primary, bold = true }
    )
    set_hl(
        "@markup.heading.2",
        { fg = colors.yellow or colors.tertiary, bold = true }
    )
    set_hl(
        "@markup.heading.3",
        { fg = colors.green or colors.tertiary, bold = true }
    )
    set_hl(
        "@markup.heading.4",
        { fg = colors.peach or colors.secondary, bold = true }
    )
    set_hl(
        "@markup.heading.5",
        { fg = colors.pink or colors.primary, bold = true }
    )
    set_hl(
        "@markup.heading.6",
        { fg = colors.teal or colors.tertiary, bold = true }
    )
    set_hl(
        "@markup.quote",
        { fg = colors.overlay2 or colors.outlineVariant, italic = true }
    )
    set_hl("@markup.math", { fg = colors.blue or colors.primary })
    set_hl(
        "@markup.link",
        { fg = colors.blue or colors.primary, underline = true }
    )
    set_hl("@markup.link.label", { fg = colors.sapphire or colors.tertiary })
    set_hl(
        "@markup.link.url",
        { fg = colors.blue or colors.primary, underline = true }
    )
    set_hl("@markup.raw", { fg = colors.teal or colors.tertiary })
    set_hl("@markup.raw.block", { fg = colors.teal or colors.tertiary })
    set_hl("@markup.list", { fg = colors.mauve or colors.secondary })
    set_hl("@markup.list.checked", { fg = colors.success })
    set_hl("@markup.list.unchecked", { fg = colors.overlay1 or colors.outline })

    -- Tags (HTML, XML, etc.)
    set_hl("@tag", { fg = colors.mauve or colors.secondary })
    set_hl("@tag.attribute", { fg = colors.yellow or colors.tertiary })
    set_hl("@tag.delimiter", { fg = colors.overlay2 or colors.outlineVariant })

    -- Plugin-specific highlights
    -- Telescope
    set_hl("TelescopeBorder", { fg = colors.outline, bg = colors.surface })
    set_hl(
        "TelescopeNormal",
        { fg = colors.text or colors.onSurface, bg = colors.surface }
    )
    set_hl("TelescopeSelection", {
        fg = colors.text or colors.onSurface,
        bg = colors.surface1 or colors.surfaceContainer,
    })
    set_hl(
        "TelescopeSelectionCaret",
        { fg = colors.primary, bg = colors.surface1 or colors.surfaceContainer }
    )
    set_hl("TelescopeMultiSelection", {
        fg = colors.text or colors.onSurface,
        bg = colors.surface2 or colors.surfaceContainerHigh,
    })
    set_hl("TelescopeTitle", { fg = colors.primary, bold = true })
    set_hl(
        "TelescopePromptTitle",
        { fg = colors.base or colors.background, bg = colors.primary }
    )
    set_hl(
        "TelescopeResultsTitle",
        { fg = colors.base or colors.background, bg = colors.secondary }
    )
    set_hl(
        "TelescopePreviewTitle",
        { fg = colors.base or colors.background, bg = colors.tertiary }
    )

    -- Neo-tree
    set_hl(
        "NeoTreeNormal",
        { fg = colors.text or colors.onSurface, bg = colors.surface }
    )
    set_hl("NeoTreeDirectoryName", { fg = colors.blue or colors.primary })
    set_hl("NeoTreeDirectoryIcon", { fg = colors.blue or colors.primary })
    set_hl("NeoTreeFileName", { fg = colors.text or colors.onSurface })
    set_hl("NeoTreeFileIcon", { fg = colors.text or colors.onSurface })
    set_hl("NeoTreeIndentMarker", { fg = colors.overlay0 or colors.outline })
    set_hl("NeoTreeGitAdded", { fg = colors.success })
    set_hl("NeoTreeGitModified", { fg = colors.peach or colors.secondary })
    set_hl("NeoTreeGitDeleted", { fg = colors.error })
    set_hl("NeoTreeGitUntracked", { fg = colors.blue or colors.primary })

    -- Which-key
    set_hl("WhichKey", { fg = colors.mauve or colors.secondary })
    set_hl("WhichKeyGroup", { fg = colors.blue or colors.primary })
    set_hl("WhichKeyDesc", { fg = colors.text or colors.onSurface })
    set_hl(
        "WhichKeySeperator",
        { fg = colors.overlay2 or colors.outlineVariant }
    )
    set_hl("WhichKeyFloat", { bg = colors.surface })
    set_hl("WhichKeyBorder", { fg = colors.outline })

    -- vim.notify("m3scheme loaded successfully from " .. vim.fn.expand(scheme_path), vim.log.levels.INFO)
end

apply_colors()
