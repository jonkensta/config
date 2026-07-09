return {
    -- Java language server. JDTLS needs a per-project workspace dir and a
    -- custom launch command, so it is driven by nvim-jdtls rather than the
    -- generic lspconfig loop in plugins/lsp.lua. The jdtls server binary is
    -- installed via Mason (see ensure_installed in plugins/lsp.lua).
    {
        "mfussenegger/nvim-jdtls",
        ft = "java",
        config = function()
            local jdtls = require("jdtls")

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "java",
                callback = function()
                    local pkg = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
                    local launcher = vim.fn.glob(pkg .. "/plugins/org.eclipse.equinox.launcher_*.jar")
                    local root = vim.fs.root(0, { "gradlew", "settings.gradle", "build.gradle", ".git" })
                    if not root then
                        return
                    end
                    local workspace = vim.fn.stdpath("cache") .. "/jdtls/" .. vim.fn.fnamemodify(root, ":p:h:t")

                    jdtls.start_or_attach({
                        cmd = {
                            "java",
                            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                            "-Dosgi.bundles.defaultStartLevel=4",
                            "-Declipse.product=org.eclipse.jdt.ls.core.product",
                            "-Xmx1g",
                            "--add-modules=ALL-SYSTEM",
                            "--add-opens",
                            "java.base/java.util=ALL-UNNAMED",
                            "--add-opens",
                            "java.base/java.lang=ALL-UNNAMED",
                            "-jar",
                            launcher,
                            "-configuration",
                            pkg .. "/config_linux",
                            "-data",
                            workspace,
                        },
                        root_dir = root,
                        capabilities = require("blink.cmp").get_lsp_capabilities(),
                        settings = {
                            java = {
                                configuration = {
                                    runtimes = {
                                        { name = "JavaSE-21", path = vim.fn.expand("$JAVA_HOME") },
                                    },
                                },
                            },
                        },
                    })
                end,
            })
        end,
    },
}
