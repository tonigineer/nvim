local function autocmd(module)
    return require("autocmd." .. module)
end

autocmd("linting")
