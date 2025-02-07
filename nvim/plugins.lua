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
    use 'wbthomason/packer.nvim'           -- Plugin Manager
    use 'nvim-telescope/telescope.nvim'    -- Fuzzy Finder
    use 'nvim-tree/nvim-tree.lua'          -- File Explorer
    use 'nvim-lua/plenary.nvim'            -- Lua utilities for Telescope
    use 'sonph/onehalf'                    -- OneHalfDark theme
  end)
  
  require("nvim-tree").setup {}
  