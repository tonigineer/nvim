return {
    "nvim-mini/mini.files",
    version = "*",
    keys = require("tonigineer.remap").minifiles,
    config = function()
        require("mini.files").setup({
            options = {
                permanent_delete = true,
                use_as_default_explorer = true,
            },
            windows = {
                max_number = math.huge,
                preview = false,
                width_focus = 50,
                width_nofocus = 15,
                width_preview = 25,
            },
        })
    end,
}
