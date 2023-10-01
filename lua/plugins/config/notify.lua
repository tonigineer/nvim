require("notify").setup {
    -- https://github.com/rcarriga/nvim-notify
    stages = "static",
    render = "wrapped-compact",
    timeout = 2000,
    max_width = 60,
}
