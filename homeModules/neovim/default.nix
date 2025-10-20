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

              -- Neo-tree file explorer setup
              require('neo-tree').setup({
                close_if_last_window = true,
                popup_border_style = "rounded",
                enable_git_status = true,
                enable_diagnostics = true,
                default_component_configs = {
                  indent = {
                    indent_size = 2,
                    padding = 1,
                  },
                  icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    default = "",
                  },
                  git_status = {
                    symbols = {
                      added     = "✚",
                      modified  = "",
                      deleted   = "✖",
                      renamed   = "➜",
                      untracked = "★",
                      ignored   = "◌",
                      unstaged  = "✗",
                      staged    = "✓",
                      conflict  = "",
                    }
                  },
                },
                window = {
                  position = "left",
                  width = 30,
                  mappings = {
                    ["<space>"] = "none",
                  },
                },
                filesystem = {
                  follow_current_file = {
                    enabled = true,
                  },
                  use_libuv_file_watcher = true,
                  filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                  },
                },
              })

              -- Neo-tree keybindings
              vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = 'Toggle file explorer' })
              vim.keymap.set('n', '<leader>o', '<cmd>Neotree focus<CR>', { desc = 'Focus file explorer' })

              -- Lspsaga setup for better LSP UI
              require('lspsaga').setup({
                ui = {
                  border = 'rounded',
                  colors = {
                    normal_bg = '#282c34',
                  },
                },
                symbol_in_winbar = {
                  enable = false,
                },
                lightbulb = {
                  enable = false,
                },
              })

              -- Completion setup (nvim-cmp)
              local cmp = require('cmp')
              local luasnip = require('luasnip')
              
              require('luasnip.loaders.from_vscode').lazy_load()
              
              cmp.setup({
                snippet = {
                  expand = function(args)
                    luasnip.lsp_expand(args.body)
                  end,
                },
                window = {
                  completion = cmp.config.window.bordered({
                    border = 'rounded',
                    winhighlight = 'Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None',
                    max_height = 3,
                  }),
                  documentation = cmp.config.window.bordered({
                    border = 'rounded',
                  }),
                },
                performance = {
                  max_view_entries = 3,
                },
                mapping = cmp.mapping.preset.insert({
                  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                  ['<C-f>'] = cmp.mapping.scroll_docs(4),
                  ['<C-Space>'] = cmp.mapping.complete(),
                  ['<C-e>'] = cmp.mapping.abort(),
                  ['<CR>'] = cmp.mapping.confirm({ select = true }),
                  ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                      cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                      luasnip.expand_or_jump()
                    else
                      fallback()
                    end
                  end, { 'i', 's' }),
                  ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                      cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                      luasnip.jump(-1)
                    else
                      fallback()
                    end
                  end, { 'i', 's' }),
                }),
                sources = cmp.config.sources({
                  { name = 'nvim_lsp' },
                  { name = 'luasnip' },
                }, {
                  { name = 'buffer' },
                  { name = 'path' },
                })
              })
              
              -- Command line completion
              cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                  { name = 'path' }
                }, {
                  { name = 'cmdline' }
                })
              })
              
              -- Search completion
              cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                  { name = 'buffer' }
                }
              })

              -- LSP keybindings with Lspsaga
              vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', { desc = 'Go to definition' })
              vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
              vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { desc = 'Hover documentation' })
              vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', { desc = 'Rename symbol' })
              vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', { desc = 'Code action' })
              vim.keymap.set('n', 'gr', '<cmd>Lspsaga finder<CR>', { desc = 'Find references' })
              vim.keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', { desc = 'Previous diagnostic' })
              vim.keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', { desc = 'Next diagnostic' })
              vim.keymap.set('n', '<leader>d', '<cmd>Lspsaga show_line_diagnostics<CR>', { desc = 'Show line diagnostics' })
              vim.keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<CR>', { desc = 'Toggle outline' })
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

              -- GitHub Copilot setup
              vim.g.copilot_no_tab_map = true
              vim.g.copilot_assume_mapped = true
              vim.g.copilot_tab_fallback = ""
              
              -- Copilot keybindings
              vim.keymap.set('i', '<C-j>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false, desc = 'Accept Copilot suggestion' })
              vim.keymap.set('i', '<C-l>', '<Plug>(copilot-accept-word)', { desc = 'Accept Copilot word' })
              vim.keymap.set('i', '<M-]>', '<Plug>(copilot-next)', { desc = 'Next Copilot suggestion' })
              vim.keymap.set('i', '<M-[>', '<Plug>(copilot-previous)', { desc = 'Previous Copilot suggestion' })
              vim.keymap.set('i', '<C-\\>', '<Plug>(copilot-dismiss)', { desc = 'Dismiss Copilot suggestion' })
      EOF
    '';
  };

  home.packages = with pkgs; [
    ripgrep
    fd
    gcc
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
