{ pkgs, config, ... }:
{
  programs.neovim.extraConfig = ''
    lua << EOF
      vim.cmd [[colorscheme doom-one]]

      require('lualine').setup {
        options = {
#          theme = 'doom-one', I NEED TO FIX THIS LATER   
          icons_enabled = true,
        }
      }

      require('nvim-web-devicons').setup()

      require('orgmode').setup({
        org_agenda_files = {'~/org/*'},
        org_default_notes_file = '~/org/refile.org',
      })
    EOF
  '';
}
