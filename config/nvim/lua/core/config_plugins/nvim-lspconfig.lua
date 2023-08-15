local on_attach = function(client, bufnr)
    --> keymaps
    --vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    --vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {}) --> close split `:on` (only)
    --vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    --vim.keymap.set("n", "F", vim.lsp.buf.format, {})
    --vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})

    vim.api.nvim_create_user_command("LspRename", "lua vim.lsp.buf.rename()", {})

    -- Disable syntax highlighting through LSP.
    client.server_capabilities.semanticTokensProvider = nil

    -- Create command `LspFormat` when LSP formatting is available.
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_user_command("LspFormat", "lua vim.lsp.buf.format({ async = true })", {})
    end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

lspconfig.bashls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" }
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
    settings = {
        pylsp = {
            plugins = {
                pylint = {
                    enabled = true,
                },
                pycodestyle = {
                    enabled = true,
                },
                flake8 = {
                    enabled = true,
                },
                yapf = {
                    enabled = true,
                },
                black = {
                    enabled = true,
                },
            },
        },
    },
})

lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.eslint.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.tsserver.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.clojure_lsp.setup({
    on_attach = on_attach,
    capabilities = capabilities
})
