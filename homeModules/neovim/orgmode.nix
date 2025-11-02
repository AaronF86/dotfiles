{ pkgs, config, ... }:
{
  programs.neovim.extraConfig = ''
    lua << EOF
      -- Orgmode main setup (MUST BE FIRST)
      require('orgmode').setup({
        org_agenda_files = {
          '~/notes/**/*',
          '~/Documents/UNI/notes/**/*'
        },
        org_default_notes_file = '~/notes/refile.org',
        org_capture_templates = {
          u = {
            description = 'Uni Notes',
            template = '* Week %^{Week Number} - %^{Lecture Name}\n  Date: %U\n** Notes\n  - %?\n',
            target = '~/Documents/UNI/notes/refile.org'
          },
          a = {
            description = 'Uni Task',
            template = '* TODO %^{Task Description}\n  Course: %^{Course}\n  Week: %^{Week Number}\n  SCHEDULED: %^{Due Date|%t}\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n** Steps\n  - [ ] ',
            target = '~/Documents/UNI/notes/refile.org'
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

      -- Headlines: Additional visual highlights for org headlines (if available)
      pcall(function()
        require("headlines").setup({
          org = {
            headline_highlights = { "Headline1", "Headline2", "Headline3", "Headline4", "Headline5", "Headline6" },
            codeblock_highlight = "CodeBlock",
            dash_highlight = "Dash",
            quote_highlight = "Quote",
          },
        })
      end)

      -- Orgmode keymaps (must be outside setup)
      vim.keymap.set('n', '<leader>oa', '<cmd>OrgAgenda<CR>')
      vim.keymap.set('n', '<leader>oc', '<cmd>OrgCapture<CR>')
      vim.keymap.set('n', '<leader>ot', '<cmd>OrgTodo<CR>')
      vim.keymap.set('n', '<leader>on', '<cmd>OrgNext<CR>')

      -- Org-roam setup
      local org_roam = require('org-roam')
      org_roam.setup({
        org_roam_directory = vim.fn.expand('~/notes/roam'),
        db_location = vim.fn.expand('~/.local/share/org-roam/org-roam.db'),
        index = {
          autoload = true,
          -- use default filetype 'org'
        },
      })

      -- Telescope integration (if telescope and org-roam telescope extension present)
      pcall(function()
        require('telescope').load_extension('org_roam')
      end)

      -- Org-roam keybindings
      vim.keymap.set('n', '<leader>rf', '<cmd>lua require("org-roam.ui.finders").find_files()<CR>', { desc = 'Org-roam find file' })
      vim.keymap.set('n', '<leader>rn', '<cmd>lua require("org-roam.ui.open")()<CR>', { desc = 'Org-roam node find/open' })
      vim.keymap.set('n', '<leader>rc', '<cmd>OrgCapture<CR>', { desc = 'Org capture (org-roam captures via orgmode)' })
      vim.keymap.set('n', '<leader>ri', '<cmd>lua require("org-roam").insert({})<CR>', { desc = 'Org-roam insert' })
      vim.keymap.set('n', '<leader>rb', '<cmd>lua require("org-roam").backlinks({})<CR>', { desc = 'Org-roam backlinks' })

    EOF
  '';

  # Ensure roam directory exists and create placeholder files
  home.file."notes/roam/.keep".text = "";
  home.file."notes/.keep".text = "";
}
