require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls",
        "clangd",
        "clojure_lsp",
        "efm",
        "lua_ls",
        "marksman",
        "pylsp",
        "rust_analyzer",
    },
})
