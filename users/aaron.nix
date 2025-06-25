{ config, pkgs, ... }: {
  home.username = "aaron";
  home.homeDirectory = "/home/aaron";
  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "Aaron Dev";
    userEmail = "aaron@example.org";
  };

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [ lua-language-server ];
  };


  home.packages = with pkgs; [
    firefox
    ghostty
    mattermost-desktop
    discord
    vscode
    jetbrains.idea-ultimate
  ];
}
