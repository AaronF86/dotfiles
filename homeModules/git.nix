{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Aaron Fulton";
    userEmail = "aaronfulton86@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;

      # Conditional includes for different Git hosts
      includeIf."hasconfig:remote.*.url:git@github.com:*/**".path = "~/.config/git/github.conf";
      includeIf."hasconfig:remote.*.url:https://github.com/**".path = "~/.config/git/github.conf";

      includeIf."hasconfig:remote.*.url:git@gitlab.com:*/**".path = "~/.config/git/gitlab.conf";
      includeIf."hasconfig:remote.*.url:https://gitlab.com/**".path = "~/.config/git/gitlab.conf";

      includeIf."hasconfig:remote.*.url:git@gitlab.strath.ac.uk:*/**".path = "~/.config/git/gitlab-strath.conf";
      includeIf."hasconfig:remote.*.url:https://gitlab.strath.ac.uk/**".path = "~/.config/git/gitlab-strath.conf";
    };

    aliases = {
      st = "status";
      co = "checkout";
      br = "branch";
      ci = "commit";
      last = "log -1 HEAD";
      unstage = "reset HEAD --";
      l = "log --oneline --graph --decorate";
      amend = "commit --amend --no-edit";
    };

    ignores = [
      "*~"
      "*.swp"
      "*.swo"
      ".DS_Store"
      ".idea/"
      "*.iml"
      ".vscode/"
      "node_modules/"
      "__pycache__/"
      "*.pyc"
      ".env"
      ".direnv/"
    ];
  };

  home.file.".config/git/github.conf".text = ''
    [user]
      name = Aaron Fulton
      email = aaronfulton86@gmail.com
  '';

  home.file.".config/git/gitlab.conf".text = ''
    [user]
      name = Aaron Fulton
      email = aaronfulton86@gmail.com
  '';

  home.file.".config/git/gitlab-strath.conf".text = ''
    [user]
      name = Aaron Fulton
      email = aaron.fulton.2024@uni.strath.ac.uk
  '';
}
