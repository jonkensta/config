require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls",
        "clangd",
        "lua_ls",
        "pylsp",
        "efm",
        "marksman",
        "rust_analyzer",
        "clojure_lsp",
    },
})
