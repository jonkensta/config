return {
    -- Treesitter (main branch — required for Neovim 0.12+)
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").install({
                "lua",
                "vim",
                "vimdoc",
                "python",
                "javascript",
                "typescript",
                "java",
            })

            -- Enable highlighting and indentation per buffer. start() looks up
            -- the parser by filetype and errors if none is installed, so pcall
            -- keeps unsupported filetypes a no-op.
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    if pcall(vim.treesitter.start, args.buf) then
                        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end,
    },

    -- Treesitter text objects (main branch)
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = { lookahead = true },
            })

            local select = require("nvim-treesitter-textobjects.select")
            local map = function(key, obj)
                vim.keymap.set({ "x", "o" }, key, function()
                    select.select_textobject(obj, "textobjects")
                end, { desc = "Select " .. obj })
            end
            map("af", "@function.outer")
            map("if", "@function.inner")
            map("ac", "@class.outer")
            map("ic", "@class.inner")
        end,
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            local telescope = require("telescope")
            telescope.setup({})
            pcall(telescope.load_extension, "fzf")
        end,
    },

    -- File explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        cmd = "Neotree",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            close_if_last_window = true,
            filesystem = {
                follow_current_file = { enabled = true },
                use_libuv_file_watcher = true,
            },
            window = {
                position = "left",
                width = 30,
            },
        },
    },

    -- Comments
    {
        "numToStr/Comment.nvim",
        keys = {
            { "gc", mode = { "n", "v" } },
            { "gb", mode = { "n", "v" } },
        },
        opts = {},
    },

    -- Auto pairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },

    -- Surround text objects
    {
        "kylechui/nvim-surround",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },

    -- Better repeat
    {
        "tpope/vim-repeat",
        keys = { "." },
    },

    -- Git diff viewer (also backs Neogit's diff views); own triggers so
    -- :DiffviewOpen works without opening Neogit first
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },

    -- Git integration
    {
        "NeogitOrg/neogit",
        cmd = "Neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
        opts = {
            integrations = {
                diffview = true,
            },
        },
    },

    -- Sleuth (auto-detect indentation)
    {
        "tpope/vim-sleuth",
        event = { "BufReadPre", "BufNewFile" },
    },

    -- Fast navigation
    {
        "folke/flash.nvim",
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "x", "o" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
        },
        opts = {},
    },
}
