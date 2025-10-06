local opt = vim.opt

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- UI
opt.number = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.mouse = "a"

-- Editing
opt.breakindent = true
opt.undofile = true
opt.clipboard = "unnamedplus"

-- Search
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300

-- Completion
opt.completeopt = "menuone,noselect"

-- Command-line completion
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.wildignorecase = true