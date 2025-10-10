{pkgs, config, ...}:

{
    imports = [
           ./pluigins.nix
           ./highlighting.nix
           ./theme.nix
            ./lsp.nix
    ];


        programs.neovim = {
                enable = true;
                viAlias = true;
                vimAlias = true;

            defaultEditor = true;
            extraConfig = ''
                    lua << EOF
                            vim.g.mapleader = ' '

                            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
                            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
                            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
                            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
                            vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'References' })
                            vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, { desc = 'Format buffer' })

                            local telescope = require('telescope.builtin')
                            vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Find files' })
                            vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Live grep' })
                            vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'List buffers' })
                            vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Help tags' })

                            vim.keymap.set('n', 'gnn', function() require('nvim-treesitter.incremental_selection').init_selection() end, { desc = 'TS: Init selection' })
                            vim.keymap.set('n', 'grn', function() require('nvim-treesitter.incremental_selection').node_incremental() end, { desc = 'TS: Node incremental' })
                            vim.keymap.set('n', 'grm', function() require('nvim-treesitter.incremental_selection').node_decremental() end, { desc = 'TS: Node decremental' })
                            vim.keymap.set('n', 'grc', function() require('nvim-treesitter.incremental_selection').scope_incremental() end, { desc = 'TS: Scope incremental' })

                            vim.keymap.set('n', '<leader>oa', '<cmd>OrgAgenda<CR>', { desc = 'Orgmode Agenda' })
                            vim.keymap.set('n', '<leader>oc', '<cmd>OrgCapture<CR>', { desc = 'Orgmode Capture' })
                            vim.keymap.set('n', '<leader>ot', '<cmd>OrgTodo<CR>', { desc = 'Orgmode Todo' })
                            vim.keymap.set('n', '<leader>on', '<cmd>OrgNext<CR>', { desc = 'Orgmode Next' })
                    EOF
            '';
        };

        home.packages = with pkgs; [
            ripgrep
            fd
        ];
}