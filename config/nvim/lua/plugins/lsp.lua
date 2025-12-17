return {
    -- Mason for LSP server management
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        opts = {},
    },

    -- Mason-LSPConfig bridge
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                "lua_ls",
                "stylua",
                "ts_ls",
                "basedpyright",
                "gopls",
                "marksman",
                "jdtls",
            },
            automatic_installation = true,
        },
    },

    -- LSP Configuration
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            -- LSP keymaps function
            local on_attach = function(_, bufnr)
                local keymap = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
                end

                keymap("gd", vim.lsp.buf.definition, "Goto Definition")
                keymap("gD", vim.lsp.buf.type_definition, "Goto Type Definition")
                keymap("gr", vim.lsp.buf.references, "Goto References")
                keymap("gI", vim.lsp.buf.implementation, "Goto Implementation")
                keymap("K", vim.lsp.buf.hover, "Hover Documentation")
                keymap("<leader>rn", vim.lsp.buf.rename, "Rename")
                keymap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
                keymap("<leader>cd", vim.diagnostic.open_float, "Line Diagnostic")
                keymap("<leader>cf", vim.lsp.buf.format, "Format Buffer")
            end

            -- Capabilities
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            -- LSP servers
            local servers = {
                lua_ls = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            checkThirdParty = false,
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = { enable = false },
                    },
                },
                ts_ls = {},
                basedpyright = {},
                gopls = {},
                marksman = {},
                jdtls = {},
            }

            -- Setup servers
            for server, settings in pairs(servers) do
                vim.lsp.config(server, {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = settings,
                })
            end
        end,
    },

    -- Autocompletion
    {
        "saghen/blink.cmp",
        version = "1.*",
        dependencies = { "rafamadriz/friendly-snippets" },
        event = { "InsertEnter", "CmdlineEnter" },
        opts = {
            keymap = {
                preset = "default",
                ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<C-e>"] = { "hide" },
                ["<CR>"] = { "accept", "fallback" },
                ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
                ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
                ["<C-d>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
            },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            completion = {
                accept = {
                    auto_brackets = {
                        enabled = true,
                    },
                },
                menu = {
                    draw = {
                        treesitter = { "lsp" },
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                },
            },
            signature = {
                enabled = true,
            },
        },
        opts_extend = { "sources.default" },
    },

    -- Formatting
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        config = function()
            local conform = require("conform")
            conform.setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "isort", "black" },
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    json = { "prettier" },
                },
                format_on_save = {
                    timeout_ms = 500,
                    lsp_fallback = true,
                },
            })
        end,
    },
}
