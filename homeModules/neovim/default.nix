{ pkgs, config, ... }:

{
  imports = [
    ./plugins.nix
    ./highlighting.nix
    ./theme.nix
    ./lsp.nix
    ./orgmode.nix
  ];


  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    defaultEditor = true;
    extraConfig = ''
      lua << EOF
              vim.g.mapleader = ' '
                            
              vim.opt.number = true
              vim.opt.relativenumber = true
              vim.opt.colorcolumn = '100'
              vim.opt.tabstop = 2
              vim.opt.shiftwidth = 2
              vim.opt.expandtab = true
                            
              require('nvim-autopairs').setup{}

              vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
              vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
              vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
              vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
              vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'References' })
              vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, { desc = 'Format buffer' })

              local telescope = require('telescope.builtin')
              vim.keymap.set('n', '<leader>ff', telescope.find_files)
              vim.keymap.set('n', '<leader>fg', telescope.live_grep)
              vim.keymap.set('n', '<leader>fb', telescope.buffers)
              vim.keymap.set('n', '<leader>fh', telescope.help_tags)
              vim.keymap.set('n', '<leader>fn', function()
                telescope.find_files({ cwd = '~/notes' })
              end)
              vim.keymap.set('n', '<leader>fs', function()
                telescope.live_grep({ cwd = '~/notes' })
              end)

              vim.keymap.set('n', 'gnn', function() require('nvim-treesitter.incremental_selection').init_selection() end)
              vim.keymap.set('n', 'grn', function() require('nvim-treesitter.incremental_selection').node_incremental() end)
              vim.keymap.set('n', 'grm', function() require('nvim-treesitter.incremental_selection').node_decremental() end)
              vim.keymap.set('n', 'grc', function() require('nvim-treesitter.incremental_selection').scope_incremental() end)
      EOF
    '';
  };

  home.packages = with pkgs; [
    ripgrep
    fd
    gcc
    steam-run
    teamspeak6-client
  ];
}
