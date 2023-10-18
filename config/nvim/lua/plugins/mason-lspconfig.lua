require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls",
        "clangd",
        "lua_ls",
        "pylsp",
        "efm",
        "rust_analyzer",
        "clojure_lsp",
    },
})
