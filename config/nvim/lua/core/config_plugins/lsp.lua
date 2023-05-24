--> auto-format when saving
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
    --> keymaps
    --vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    --vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {}) --> close split `:on` (only)
    --vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    --vim.keymap.set("n", "F", vim.lsp.buf.format, {})
    --vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})

    --> auto-format when saving
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
        })
    end
end

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Language servers
local lspconfig = require('lspconfig')

lspconfig.bashls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    --filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" }
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" } -- remove proto filetype
})

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

lspconfig.pylsp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.eslint.setup({
    capabilities = capabilities
})

--> :NullLsInfo to see supported languages
local null_ls = require("null-ls");
null_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    sources = {
        null_ls.builtins.formatting.prettier,
        -- null_ls.builtins.diagnostics.flake8,
        -- null_ls.builtins.diagnostics.pydocstyle,
        -- null_ls.builtins.diagnostics.pylint,
        -- null_ls.builtins.diagnostics.pylama,
        -- null_ls.builtins.diagnostics.vulture,
    },
})
