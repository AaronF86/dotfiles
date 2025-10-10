{ pkgs, config, ... }:
{
  programs.neovim.extraConfig = ''
    lua << EOF
      vim.lsp.config('clangd', {
        cmd = { 'clangd' },
        filetypes = { 'c', 'cpp' },
        root_markers = { '.clangd', 'compile_commands.json', '.git' },
      })
      vim.lsp.enable('clangd')
    EOF
  '';

  home.packages = with pkgs; [ clang-tools ];
}
