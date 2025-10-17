{ pkgs, config, ... }:
{
  programs.neovim.extraConfig = ''
    lua << EOF
      local lspconfig = require('lspconfig')
      
      -- C/C++ LSP (clangd)
      lspconfig.clangd.setup({
        cmd = { 'clangd' },
        filetypes = { 'c', 'cpp' },
        root_dir = lspconfig.util.root_pattern('.clangd', 'compile_commands.json', '.git'),
      })
      
      -- Nix LSP (nil)
      lspconfig.nil_ls.setup({
        settings = {
          ['nil'] = {
            formatting = {
              command = { "nixpkgs-fmt" },
            },
          },
        },
      })
      
      -- Rust LSP (rust-analyzer)
      lspconfig.rust_analyzer.setup({
        settings = {
          ['rust-analyzer'] = {
            cargo = {
              allFeatures = true,
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      })
    EOF
  '';
}
