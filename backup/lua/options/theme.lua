require('rose-pine').setup({
    ---usage 'auto'|'main'|'moon'|'dawn'
    variant = 'moon',
    ---usage 'main'|'moon'|'dawn'
    dark_variant = 'moon',
    bold_vert_split = true,
    dim_nc_background = false,
    disable_background = true,
    disable_float_background = true,
    disable_italics = true,
})

vim.cmd("colorscheme rose-pine")

