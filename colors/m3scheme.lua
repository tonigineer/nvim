vim.cmd.highlight("clear")
if vim.fn.exists("syntax_on") then vim.cmd.syntax("reset") end

vim.o.termguicolors = true
vim.g.colors_name = "m3scheme"

-- ──── Helpers ─────────────────────────────────────────────────────────────────

local function read_json_file(filepath)
    local expanded = vim.fn.expand(filepath)
    if vim.fn.filereadable(expanded) == 0 then
        vim.notify(
            "m3scheme: JSON file not found at " .. expanded,
            vim.log.levels.ERROR
        )
        return nil
    end

    local content = vim.fn.readfile(expanded)
    local json = table.concat(content, "")
    if json == "" then
        vim.notify("m3scheme: JSON file is empty.", vim.log.levels.ERROR)
        return nil
    end

    local ok, result = pcall(vim.fn.json_decode, json)
    if not ok then
        vim.notify(
            "m3scheme: Failed to parse JSON: " .. tostring(result),
            vim.log.levels.ERROR
        )
        return nil
    end
    return result
end

local function ensure_hex(color)
    if type(color) == "string" and not color:match("^#") then
        return "#" .. color
    end
    return color
end

local function set_hl(group, opts) vim.api.nvim_set_hl(0, group, opts) end

-- Helper to normalize color names, mapping catppuccin-style names to M3 names.
local function normalize_colors(colors)
    local c = {}
    for key, value in pairs(colors) do
        c[key] = ensure_hex(value)
    end
    -- Provide M3 fallbacks for catppuccin-style color names.
    c.text = c.text or c.onBackground
    c.base = c.base or c.background
    c.surface = c.surface or c.surfaceContainerHigh
    c.surface0 = c.surface0 or c.surfaceContainerLow
    c.surface1 = c.surface1 or c.surfaceContainer
    c.surface2 = c.surface2 or c.surfaceContainerHigh
    c.overlay0 = c.overlay0 or c.outline
    c.overlay1 = c.overlay1 or c.outlineVariant
    c.overlay2 = c.overlay2 or c.outlineVariant
    c.primary = c.primary or c.primary
    c.secondary = c.secondary or c.secondary
    c.tertiary = c.tertiary or c.tertiary
    c.error = c.error or c.error
    c.success = c.success or c.success
    c.green = c.green or c.tertiary
    c.blue = c.blue or c.primary
    c.mauve = c.mauve or c.secondary
    c.peach = c.peach or c.secondary
    c.yellow = c.yellow or c.tertiary
    c.pink = c.pink or c.primary
    c.sky = c.sky or c.primary
    c.sapphire = c.sapphire or c.tertiary
    c.maroon = c.maroon or c.secondary
    c.teal = c.teal or c.tertiary
    c.red = c.red or c.error
    return c
end

-- ──── Apply Colors ────────────────────────────────────────────────────────────

local function apply_colors()
    local scheme_data = read_json_file("~/.local/state/caelestia/scheme.json")
    if not scheme_data or not scheme_data.colours then
        vim.notify(
            "m3scheme: Invalid data from scheme.json.",
            vim.log.levels.ERROR
        )
        return
    end

    local c = normalize_colors(scheme_data.colours)

    -- Terminal colors
    for i = 0, 15 do
        local term = c["term" .. i]
        if term then vim.g["terminal_color_" .. i] = term end
    end

    -- Base
    set_hl("Normal", { fg = c.text, bg = c.base })
    set_hl("NormalFloat", { fg = c.text, bg = c.surface })
    set_hl("FloatBorder", { fg = c.outline, bg = c.surface })
    set_hl("NormalNC", { fg = c.text, bg = c.base })

    -- Cursor and selection
    set_hl("Cursor", { fg = c.base, bg = c.primary })
    set_hl("CursorLine", { bg = c.surface0 })
    set_hl("CursorColumn", { bg = c.surface0 })
    set_hl("ColorColumn", { bg = c.surface0 })
    set_hl("Visual", { bg = c.surface1 })
    set_hl("VisualNOS", { bg = c.surface1 })
    set_hl("Search", { fg = c.base, bg = c.yellow })
    set_hl("IncSearch", { fg = c.base, bg = c.peach })
    set_hl("CurSearch", { fg = c.base, bg = c.peach })

    -- Line numbers
    set_hl("LineNr", { fg = c.overlay0 })
    set_hl("CursorLineNr", { fg = c.primary, bold = true })
    set_hl("SignColumn", { fg = c.surface1, bg = c.base })
    set_hl("FoldColumn", { fg = c.overlay0, bg = c.base })

    -- Syntax
    set_hl("Comment", { fg = c.overlay2, italic = true })
    set_hl("String", { fg = c.green })
    set_hl("Character", { fg = c.green })
    set_hl("Number", { fg = c.peach })
    set_hl("Boolean", { fg = c.peach })
    set_hl("Float", { fg = c.peach })
    set_hl("Identifier", { fg = c.text })
    set_hl("Function", { fg = c.blue })
    set_hl("Statement", { fg = c.mauve })
    set_hl("Conditional", { fg = c.mauve })
    set_hl("Repeat", { fg = c.mauve })
    set_hl("Label", { fg = c.sapphire })
    set_hl("Operator", { fg = c.sky })
    set_hl("Keyword", { fg = c.mauve })
    set_hl("Exception", { fg = c.mauve })
    set_hl("PreProc", { fg = c.pink })
    set_hl("Include", { fg = c.pink })
    set_hl("Define", { fg = c.pink })
    set_hl("Macro", { fg = c.pink })
    set_hl("PreCondit", { fg = c.pink })
    set_hl("Type", { fg = c.yellow })
    set_hl("StorageClass", { fg = c.yellow })
    set_hl("Structure", { fg = c.yellow })
    set_hl("Typedef", { fg = c.yellow })
    set_hl("Special", { fg = c.blue })
    set_hl("SpecialChar", { fg = c.maroon })
    set_hl("Tag", { fg = c.mauve })
    set_hl("Delimiter", { fg = c.overlay2 })
    set_hl("SpecialComment", { fg = c.overlay2 })
    set_hl("Debug", { fg = c.overlay2 })
    set_hl("Underlined", { fg = c.blue, underline = true })
    set_hl("Ignore", { fg = c.overlay0 })
    set_hl("Error", { fg = c.error })
    set_hl("Todo", { fg = c.base, bg = c.yellow })

    -- Diff
    set_hl("DiffAdd", { fg = c.success, bg = c.successContainer })
    set_hl("DiffChange", { fg = c.blue, bg = c.surface1 })
    set_hl("DiffDelete", { fg = c.error, bg = c.errorContainer })
    set_hl("DiffText", { fg = c.blue, bg = c.surface2 })

    -- Git signs
    set_hl("GitSignsAdd", { fg = c.success })
    set_hl("GitSignsChange", { fg = c.blue })
    set_hl("GitSignsDelete", { fg = c.error })

    -- Statusline
    set_hl("StatusLine", { fg = c.text, bg = c.surface })
    set_hl("StatusLineNC", { fg = c.overlay1, bg = c.surface })
    set_hl("WinSeparator", { fg = c.outline })

    -- Tabline
    set_hl("TabLine", { fg = c.overlay1, bg = c.surface })
    set_hl("TabLineFill", { fg = c.overlay1, bg = c.surface })
    set_hl("TabLineSel", { fg = c.text, bg = c.surface1 })

    -- Popup menu
    set_hl("Pmenu", { fg = c.text, bg = c.surface })
    set_hl("PmenuSel", { fg = c.base, bg = c.primary })
    set_hl("PmenuSbar", { bg = c.surface1 })
    set_hl("PmenuThumb", { bg = c.overlay0 })

    -- Diagnostics
    set_hl("DiagnosticError", { fg = c.error })
    set_hl("DiagnosticWarn", { fg = c.peach })
    set_hl("DiagnosticInfo", { fg = c.blue })
    set_hl("DiagnosticHint", { fg = c.teal })
    set_hl("DiagnosticOk", { fg = c.success })
    set_hl("DiagnosticVirtualTextError", { fg = c.error, bg = c.surface0 })
    set_hl("DiagnosticVirtualTextWarn", { fg = c.peach, bg = c.surface0 })
    set_hl("DiagnosticVirtualTextInfo", { fg = c.blue, bg = c.surface0 })
    set_hl("DiagnosticVirtualTextHint", { fg = c.teal, bg = c.surface0 })
    set_hl("DiagnosticVirtualTextOk", { fg = c.success, bg = c.surface0 })
    set_hl("DiagnosticUnderlineError", { undercurl = true, sp = c.error })
    set_hl("DiagnosticUnderlineWarn", { undercurl = true, sp = c.peach })
    set_hl("DiagnosticUnderlineInfo", { undercurl = true, sp = c.blue })
    set_hl("DiagnosticUnderlineHint", { undercurl = true, sp = c.teal })
    set_hl("DiagnosticUnderlineOk", { undercurl = true, sp = c.success })

    -- LSP references
    set_hl("LspReferenceText", { bg = c.surface1 })
    set_hl("LspReferenceRead", { bg = c.surface1 })
    set_hl("LspReferenceWrite", { bg = c.surface1 })

    -- Treesitter
    set_hl("@variable", { fg = c.text })
    set_hl("@variable.builtin", { fg = c.red })
    set_hl("@variable.parameter", { fg = c.maroon })
    set_hl("@variable.member", { fg = c.blue })
    set_hl("@constant", { fg = c.peach })
    set_hl("@constant.builtin", { fg = c.peach })
    set_hl("@constant.macro", { fg = c.peach })
    set_hl("@module", { fg = c.blue })
    set_hl("@label", { fg = c.sapphire })
    set_hl("@string", { fg = c.green })
    set_hl("@string.documentation", { fg = c.green })
    set_hl("@string.regexp", { fg = c.peach })
    set_hl("@string.escape", { fg = c.pink })
    set_hl("@character", { fg = c.green })
    set_hl("@character.special", { fg = c.pink })
    set_hl("@number", { fg = c.peach })
    set_hl("@number.float", { fg = c.peach })
    set_hl("@boolean", { fg = c.peach })
    set_hl("@annotation", { fg = c.yellow })
    set_hl("@attribute", { fg = c.yellow })
    set_hl("@error", { fg = c.error })
    set_hl("@function", { fg = c.blue })
    set_hl("@function.builtin", { fg = c.peach })
    set_hl("@function.call", { fg = c.blue })
    set_hl("@function.macro", { fg = c.peach })
    set_hl("@function.method", { fg = c.blue })
    set_hl("@function.method.call", { fg = c.blue })
    set_hl("@constructor", { fg = c.sapphire })
    set_hl("@operator", { fg = c.sky })
    set_hl("@keyword", { fg = c.mauve })
    set_hl("@keyword.function", { fg = c.mauve })
    set_hl("@keyword.operator", { fg = c.mauve })
    set_hl("@keyword.return", { fg = c.mauve })
    set_hl("@keyword.conditional", { fg = c.mauve })
    set_hl("@keyword.repeat", { fg = c.mauve })
    set_hl("@keyword.exception", { fg = c.mauve })
    set_hl("@keyword.import", { fg = c.pink })
    set_hl("@keyword.storage", { fg = c.yellow })
    set_hl("@keyword.directive", { fg = c.pink })
    set_hl("@keyword.directive.define", { fg = c.pink })

    -- Types
    set_hl("@type", { fg = c.yellow })
    set_hl("@type.builtin", { fg = c.yellow })
    set_hl("@type.definition", { fg = c.yellow })
    set_hl("@type.qualifier", { fg = c.yellow })

    -- Punctuation
    set_hl("@punctuation.delimiter", { fg = c.overlay2 })
    set_hl("@punctuation.bracket", { fg = c.overlay2 })
    set_hl("@punctuation.special", { fg = c.sky })

    -- Comments
    set_hl("@comment", { fg = c.overlay2, italic = true })
    set_hl("@comment.documentation", { fg = c.overlay2 })
    set_hl("@comment.error", { fg = c.error })
    set_hl("@comment.warning", { fg = c.peach })
    set_hl("@comment.note", { fg = c.blue })
    set_hl("@comment.todo", { fg = c.base, bg = c.yellow })

    -- Markup
    set_hl("@markup.strong", { fg = c.maroon, bold = true })
    set_hl("@markup.emphasis", { fg = c.maroon, italic = true })
    set_hl("@markup.underline", { fg = c.text, underline = true })
    set_hl("@markup.strike", { fg = c.text, strikethrough = true })
    set_hl("@markup.heading", { fg = c.blue, bold = true })
    set_hl("@markup.heading.1", { fg = c.blue, bold = true })
    set_hl("@markup.heading.2", { fg = c.yellow, bold = true })
    set_hl("@markup.heading.3", { fg = c.green, bold = true })
    set_hl("@markup.heading.4", { fg = c.peach, bold = true })
    set_hl("@markup.heading.5", { fg = c.pink, bold = true })
    set_hl("@markup.heading.6", { fg = c.teal, bold = true })
    set_hl("@markup.quote", { fg = c.overlay2, italic = true })
    set_hl("@markup.math", { fg = c.blue })
    set_hl("@markup.link", { fg = c.blue, underline = true })
    set_hl("@markup.link.label", { fg = c.sapphire })
    set_hl("@markup.link.url", { fg = c.blue, underline = true })
    set_hl("@markup.raw", { fg = c.teal })
    set_hl("@markup.raw.block", { fg = c.teal })
    set_hl("@markup.list", { fg = c.mauve })
    set_hl("@markup.list.checked", { fg = c.success })
    set_hl("@markup.list.unchecked", { fg = c.overlay1 })

    -- Tags
    set_hl("@tag", { fg = c.mauve })
    set_hl("@tag.attribute", { fg = c.yellow })
    set_hl("@tag.delimiter", { fg = c.overlay2 })

    -- Telescope
    set_hl("TelescopeBorder", { fg = c.outline, bg = c.surface })
    set_hl("TelescopeNormal", { fg = c.text, bg = c.surface })
    set_hl("TelescopeSelection", { fg = c.text, bg = c.surface1 })
    set_hl("TelescopeSelectionCaret", { fg = c.primary, bg = c.surface1 })
    set_hl("TelescopeMultiSelection", { fg = c.text, bg = c.surface2 })
    set_hl("TelescopeTitle", { fg = c.primary, bold = true })
    set_hl("TelescopePromptTitle", { fg = c.base, bg = c.primary })
    set_hl("TelescopeResultsTitle", { fg = c.base, bg = c.secondary })
    set_hl("TelescopePreviewTitle", { fg = c.base, bg = c.tertiary })

    -- Neo-tree
    set_hl("NeoTreeNormal", { fg = c.text, bg = c.surface })
    set_hl("NeoTreeDirectoryName", { fg = c.blue })
    set_hl("NeoTreeDirectoryIcon", { fg = c.blue })
    set_hl("NeoTreeFileName", { fg = c.text })
    set_hl("NeoTreeFileIcon", { fg = c.text })
    set_hl("NeoTreeIndentMarker", { fg = c.overlay0 })
    set_hl("NeoTreeGitAdded", { fg = c.success })
    set_hl("NeoTreeGitModified", { fg = c.peach })
    set_hl("NeoTreeGitDeleted", { fg = c.error })
    set_hl("NeoTreeGitUntracked", { fg = c.blue })

    -- Which-key
    set_hl("WhichKey", { fg = c.mauve })
    set_hl("WhichKeyGroup", { fg = c.blue })
    set_hl("WhichKeyDesc", { fg = c.text })
    set_hl("WhichKeySeperator", { fg = c.overlay2 })
    set_hl("WhichKeyFloat", { bg = c.surface })
    set_hl("WhichKeyBorder", { fg = c.outline })
end

apply_colors()
