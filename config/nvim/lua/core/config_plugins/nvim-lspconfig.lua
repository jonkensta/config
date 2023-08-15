local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr }
    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)

    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)

    vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader><C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

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
