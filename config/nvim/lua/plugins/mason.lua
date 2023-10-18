require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls",
        "clangd",
        "lua_ls",
        "pylsp",
        "eslint",
        "rust_analyzer",
        "clojure_lsp",
    },
})
