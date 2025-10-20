{ pkgs, config, ... }:
{
  programs.neovim.extraConfig = ''
    lua << EOF
      -- Get capabilities from nvim-cmp for LSP
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      
      -- C/C++ LSP (clangd)
      vim.lsp.config('clangd', {
        cmd = { 'clangd' },
        filetypes = { 'c', 'cpp' },
        root_markers = { '.clangd', 'compile_commands.json', '.git' },
        capabilities = capabilities,
      })
      vim.lsp.enable('clangd')
      
      -- Nix LSP (nil)
      vim.lsp.config('nil_ls', {
        cmd = { 'nil' },
        filetypes = { 'nix' },
        root_markers = { 'flake.nix', '.git' },
        capabilities = capabilities,
        settings = {
          ['nil'] = {
            formatting = {
              command = { "nixpkgs-fmt" },
            },
          },
        },
      })
      vim.lsp.enable('nil_ls')
      
      -- Rust LSP (rust-analyzer)
      vim.lsp.config('rust_analyzer', {
        cmd = { 'rust-analyzer' },
        filetypes = { 'rust' },
        root_markers = { 'Cargo.toml', '.git' },
        capabilities = capabilities,
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
      vim.lsp.enable('rust_analyzer')
    EOF
  '';

  home.packages = with pkgs; [
    clang-tools
    nil # Nix LSP
    nixpkgs-fmt # Nix formatter
    rust-analyzer # Rust LSP
    clippy # Rust linter
  ];
}
