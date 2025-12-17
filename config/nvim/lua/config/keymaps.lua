local keymap = vim.keymap.set

-- Better default experience
keymap({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Word wrap navigation
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

keymap("n", "<leader>sm", "<cmd>map<cr>", { desc = "Show keymaps" })

-- Telescope
keymap("n", "<leader><leader>", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })

keymap("n", "<leader>fc", function()
    require("telescope.builtin").commands()
end, { desc = "Telescope find commands" })

keymap("n", "<leader>ff", function()
    require("telescope.builtin").find_files()
end, { desc = "Telescope find files" })

keymap("n", "<leader>fg", function()
    require("telescope.builtin").live_grep()
end, { desc = "Telescope live grep" })

keymap("n", "<leader>fb", function()
    require("telescope.builtin").buffers()
end, { desc = "Telescope buffers" })

keymap("n", "<leader>fh", function()
    require("telescope.builtin").help_tags()
end, { desc = "Telescope help tags" })

-- File explorer
keymap("n", "-", "<cmd>Neotree toggle<cr>", { desc = "Explorer" })

-- Diagnostics
keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
keymap("n", "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer diagnostics" })

-- Git
keymap("n", "<leader>gs", "<cmd>Neogit<cr>", { desc = "Git status" })
keymap("n", "<leader>gc", "<cmd>Neogit commit<cr>", { desc = "Git commit" })
keymap("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Git diff" })
keymap("n", "<leader>gb", function()
    require("neogit").action("blame", "blame_file")()
end, { desc = "Git blame" })
