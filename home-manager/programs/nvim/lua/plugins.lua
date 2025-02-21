local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
  end
end
ensure_packer()

require('packer').startup(function(use)
  -- Plugin Manager
  use 'wbthomason/packer.nvim'

  -- File Explorer
  use 'nvim-tree/nvim-tree.lua'

  -- Fuzzy Finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- Colorscheme
  use {
    'sonph/onehalf',
    rtp = 'vim',
    config = function()
      vim.cmd('colorscheme onehalfdark')
    end
  }

  -- LSP Configuration
  use 'neovim/nvim-lspconfig'

  -- LSP Installer
  use {
    'williamboman/mason.nvim',
    run = ':MasonUpdate',
  }
  use 'williamboman/mason-lspconfig.nvim'

  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp', -- LSP completions
      'hrsh7th/cmp-buffer',   -- Buffer completions
      'hrsh7th/cmp-path',     -- Path completions
      'L3MON4D3/LuaSnip'      -- Snippet engine
    },
  }

  -- Rust-specific enhancements
  use 'simrat39/rust-tools.nvim'

  -- Cargo completions in TOML
  use {
    'saecki/crates.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  }

  -- Lua development enhancements
  use 'folke/neodev.nvim'

  -- Nix language support
  use {
    'LnL7/vim-nix',
    ft = 'nix',
  }
end)
