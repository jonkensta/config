local keymap = vim.keymap.set

-- Better default experience
keymap({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Word wrap navigation
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Telescope
keymap("n", "<leader><leader>", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "Search grep" })
keymap("n", "<leader>sb", "<cmd>Telescope buffers<cr>", { desc = "Search buffers" })
keymap("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Search help" })
keymap("n", "<leader>sk", "<cmd>Telescope commands<cr>", { desc = "Search commands" })
keymap("n", "<leader>sm", "<cmd>map<cr>", { desc = "Show keymaps" })

-- File explorer
keymap("n", "-", "<cmd>Oil<cr>", { desc = "Explorer" })

-- Diagnostics
keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
keymap("n", "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer diagnostics" })

-- Git
keymap("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git status" })
keymap("n", "<leader>gc", "<cmd>Git commit<cr>", { desc = "Git commit" })
keymap("n", "<leader>gd", "<cmd>Gdiffsplit<cr>", { desc = "Git diff" })
keymap("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "Git blame" })