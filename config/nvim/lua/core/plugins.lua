--[ plugins.lua ]--

local fn = vim.fn

-- Automatically install Packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    print "Installing Packer; close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads Neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Have Packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float {} --> .float {'single'} or 'rounded'
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    --> run manually with ':PackerSync'
    use 'wbthomason/packer.nvim'

    --> tpope's vim packages
    use {
        'tpope/vim-sensible',
        'tpope/vim-surround',
        'tpope/vim-fugitive',
    }

    --> quality of life
    use 'ctrlpvim/ctrlp.vim'

    --> Color theme.
    use 'itchyny/lightline.vim'
    use 'altercation/vim-colors-solarized'

    use 'scrooloose/nerdtree'
    use 'vim-airline/vim-airline'
    --> use 'airblade/vim-gitgutter'
    use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }

    --> context highlighting
    use 'nvim-treesitter/nvim-treesitter'
    use 'HiPhish/rainbow-delimiters.nvim'

    --> lsp, linters, dignostics
    use {
        'williamboman/mason.nvim', --> :Mason
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'jose-elias-alvarez/null-ls.nvim',
        'nvim-lua/plenary.nvim', --> prerequisite for null-ls
        run = ":MasonUpdate"     -- :MasonUpdate updates registry contents
    }

    --> autocomplete + snippets
    use {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline', --> this doesn't seem to work
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
        'rafamadriz/friendly-snippets',
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)

--[ eof ]--
