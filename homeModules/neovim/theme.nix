{ pkgs, config, ... }:
{
  programs.neovim.extraConfig = ''
    lua << EOF
      vim.cmd [[colorscheme doom-one]]

      require('lualine').setup {
        options = {
          theme = 'auto',
          icons_enabled = true,
        }
      }

      require('nvim-web-devicons').setup()
    EOF
  '';
}
