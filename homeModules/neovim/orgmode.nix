{ pkgs, config, ... }:
{
  programs.neovim.extraConfig = ''
    lua << EOF
      require('orgmode').setup({
        org_agenda_files = {'~/notes/**/*'},
        org_default_notes_file = '~/notes/refile.org',
        org_capture_templates = {
          u = {
            description = 'Uni Note',
            template = '* TODO %?\n  SCHEDULED: %t\n  :PROPERTIES:\n  :CREATED: %U\n  :END:',
            target = '~/notes/uni/refile.org'
          },
          h = {
            description = 'Haskell Learning',
            template = '* %?\n  Added: %U\n  ** Notes\n  ** Examples\n  ** Resources',
            target = '~/notes/personal/haskell.org'
          },
          p = {
            description = 'Personal Note',
            template = '* %?\n  Added: %U',
            target = '~/notes/personal/refile.org'
          },
          j = {
            description = 'Project Note',
            template = '* TODO %?\n  DEADLINE: %t\n  :PROPERTIES:\n  :CREATED: %U\n  :END:',
            target = '~/notes/projects/refile.org'
          },
          i = {
            description = 'Quick Idea',
            template = '* %?\n  %U',
            target = '~/notes/personal/ideas.org'
          },
          t = {
            description = 'Task',
            template = '* TODO %?\n  SCHEDULED: %t\n  :PROPERTIES:\n  :CREATED: %U\n  :END:',
            target = '~/notes/refile.org'
          },
        },
        mappings = {
          org = {
            org_toggle_checkbox = '<C-space>',
          },
        },
      })
      
      -- Orgmode keymaps (must be outside setup)
      vim.keymap.set('n', '<leader>oa', '<cmd>OrgAgenda<CR>')
      vim.keymap.set('n', '<leader>oc', '<cmd>OrgCapture<CR>')
      vim.keymap.set('n', '<leader>ot', '<cmd>OrgTodo<CR>')
      vim.keymap.set('n', '<leader>on', '<cmd>OrgNext<CR>')
    EOF
  '';
}
