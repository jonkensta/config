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
    --> package manager, run manually with ':PackerSync'
    use 'wbthomason/packer.nvim'

    --> tpope's vim packages
    use 'tpope/vim-sensible'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'

    --> file explorer
    use {
        'scrooloose/nerdtree',
        config = "require 'plugins.nerdtree'",
    }

    --> statusline
    use 'vim-airline/vim-airline'

    --> colorscheme
    use {
        'morhetz/gruvbox',
        config = function()
            vim.cmd.colorscheme("gruvbox")
        end
    }

    --> fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = "require 'plugins.telescope'",
    }

    --> gitgutter
    use {
        "airblade/vim-gitgutter",
        config = "require 'plugins.vim-gitgutter'",
    }

    --> local config
    use {
        'klen/nvim-config-local',
        config = "require 'plugins.config-local'",
    }
    use 'editorconfig/editorconfig-vim'

    --> context highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
        config = "require 'plugins.nvim-treesitter'"
    }
    use {
        'HiPhish/rainbow-delimiters.nvim',
        config = "require 'plugins.rainbow-delimiters'"
    }

    --> lsp, linters, dignostics
    use {
        'williamboman/mason.nvim', --> :Mason
        config = "require 'plugins.mason'",
    }
    use {
        'williamboman/mason-lspconfig.nvim',
        after = "mason.nvim",
        config = "require 'plugins.mason-lspconfig'",
        run = ':MasonUpdate' -- :MasonUpdate updates registry contents
    }
    use {
        'neovim/nvim-lspconfig',
        after = "mason-lspconfig.nvim",
        config = "require 'plugins.nvim-lspconfig'"
    }
    use {
        "lukas-reineke/lsp-format.nvim",
        after = "nvim-lspconfig",
        config = "require 'plugins.lsp-format'"
    }

    --> autocomplete + snippets
    use 'hrsh7th/cmp-nvim-lsp'
    use {
        'hrsh7th/vim-vsnip',
        config = "require 'plugins.vim-vsnip'"
    }
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use {
        'hrsh7th/nvim-cmp',
        config = "require 'plugins.nvim-cmp'"
    }
    use 'hrsh7th/cmp-vsnip'
    use 'rafamadriz/friendly-snippets'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
