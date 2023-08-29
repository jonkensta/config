local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr }
    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)

    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)

    local print_workspace_folders = function()
        print(vim.print(vim.lsp.buf.list_workspace_folders()))
    end

    vim.keymap.set('n', '<leader>wl', print_workspace_folders, opts)

    vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader><C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

    vim.api.nvim_create_user_command("LspRename", "lua vim.lsp.buf.rename()", {
        desc = "Rename a symbol using attached language-server"
    })

    local lsp_format = function(data)
        local lsp_opts = {
            async = true
        }

        for k, v in pairs(opts) do
            lsp_opts[k] = v
        end

        if data.range > 0 then
            lsp_opts.range = {
                ["start"] = { data.line1, 0 },
                ["end"] = { data.line2, 0 },
            }
        end

        vim.lsp.buf.format(lsp_opts)
    end

    vim.api.nvim_create_user_command("LspFormat", lsp_format, {
        desc = "Format buffer using attached language-server.",
        range = true
    })

    -- Disable syntax highlighting through LSP.
    client.server_capabilities.semanticTokensProvider = nil
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
