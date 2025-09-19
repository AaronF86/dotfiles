{ config, pkgs, ... }:
# TODO: Rewrite this and add support for vim org mode and also bring support for md file with images via ghossty
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    
    extraPackages = with pkgs; [
      # LSP servers
      haskell-language-server
      lua-language-server
      nil # Nix LSP
      
      # File search and navigation
      ripgrep
      fd
      fzf
      
      # Additional tools
      tree-sitter
      nodePackages.typescript-language-server
    ];
    
    plugins = with pkgs.vimPlugins; [
      # LSP configuration
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      luasnip
      cmp_luasnip
      
      # File search and navigation
      telescope-nvim
      telescope-fzf-native-nvim
      nvim-tree-lua
      
      # Syntax highlighting
      nvim-treesitter.withAllGrammars
      
      # Theme and UI
      onedark-nvim
      lualine-nvim
      nvim-web-devicons
      
      # Haskell specific
      haskell-tools-nvim
    ];
    
    extraLuaConfig = ''
      -- Basic settings
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
      vim.opt.smartindent = true
      vim.opt.wrap = false
      vim.opt.ignorecase = true
      vim.opt.smartcase = true
      vim.opt.hlsearch = false
      vim.opt.incsearch = true
      vim.opt.termguicolors = true
      vim.opt.scrolloff = 8
      vim.opt.signcolumn = "yes"
      vim.opt.isfname:append("@-@")
      vim.opt.updatetime = 50
      
      -- Set leader key
      vim.g.mapleader = " "
      
      -- Colorscheme
      require('onedark').setup {
        style = 'dark'
      }
      require('onedark').load()
      
      -- Lualine
      require('lualine').setup()
      
      -- Nvim-tree
      require("nvim-tree").setup()
      
      -- Treesitter
      require('nvim-treesitter.configs').setup {
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        }
      }
      
      -- LSP configuration
      local lspconfig = require('lspconfig')
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      
      -- CMP setup
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        })
      })
      
      -- LSP on_attach function
      local on_attach = function(client, bufnr)
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
      end
      
      -- LSP capabilities
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      
      -- Haskell LSP
      lspconfig.hls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          haskell = {
            formattingProvider = "ormolu"
          }
        }
      }
      
      -- Nix LSP
      lspconfig.nil_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
      
      -- Lua LSP
      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = {'vim'},
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }
      
      -- Telescope setup for file search
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        }
      }
      
      -- Load telescope extensions
      require('telescope').load_extension('fzf')
      
      -- Telescope keymaps
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
       
      -- File explorer keymaps
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
      
      -- General keymaps
      vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>x', ':x<CR>', { noremap = true, silent = true })
      
      -- Window navigation
      vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
      vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
      vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
      vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
    '';
  };
}