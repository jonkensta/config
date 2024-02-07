local eslint = {
    lintCommand =
    [[$([ -n "$(command -v node_modules/.bin/eslint)" ] && echo "node_modules/.bin/eslint" || echo "eslint") -f visualstudio --stdin --stdin-filename ${INPUT}]],
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {
        "%f(%l,%c): %tarning %m",
        "%f(%l,%c): %rror %m",
    },
    lintSource = "eslint",
}

local prettier = {
    formatCommand =
    [[$([ -n "$(command -v node_modules/.bin/prettier)" ] && echo "node_modules/.bin/prettier" || echo "prettier") --stdin-filepath ${INPUT} ${--config-precedence:configPrecedence} ${--tab-width:tabWidth} ${--single-quote:singleQuote} ${--trailing-comma:trailingComma}]],
    formatStdin = true,
}

local pylint = require("efmls-configs.linters.pylint")
local mypy = require("efmls-configs.linters.mypy")
local isort = require('efmls-configs.formatters.isort')
local black = require('efmls-configs.formatters.black')

local defaults = require('efmls-configs.defaults');
local languages = vim.tbl_extend('force', defaults.languages(), {
    javascript = { eslint, prettier },
    javascriptreact = { eslint, prettier },
    typescript = { eslint, prettier },
    typescriptreact = { eslint, prettier },
    vue = { eslint, prettier },
    html = { prettier },
    css = { prettier },
    json = { prettier },
    markdown = { prettier },
    scss = { prettier },
    yaml = { prettier },
    graphql = { prettier },
    svelte = { prettier },
    python = { isort, black, pylint, mypy },
});

return {
    filetypes = vim.tbl_keys(languages),
    settings = {
        rootMarkers = { '.git/' },
        languages = languages,
    },
    init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
    },
}
