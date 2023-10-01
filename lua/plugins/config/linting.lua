local lint = require("lint")

lint.linters_by_ft = {
    cpp = { "cpplint" },
    c = { "cpplint" },
    py = { "isort", "pylint" },
}
