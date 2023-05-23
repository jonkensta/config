local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<C-p>', ':Files<CR>', opts)          -- <C-p> to open file search
keymap('n', '<C-n>', ':NERDTreeToggle<CR>', opts) -- <C-n> to toggle NERDTree
