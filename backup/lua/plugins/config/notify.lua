require("notify").setup {
    -- https://github.com/rcarriga/nvim-notify
    stages = "static",
    render = "wrapped-compact",
    timeout = 5000,
    max_width = 60,
}
