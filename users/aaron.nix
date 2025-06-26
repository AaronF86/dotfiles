{ config, pkgs, ... }: 
let
  hostname = builtins.getEnv "HOSTNAME";
  isVPS = hostname == "vps-1"; # Replace with actual VPS hostname
in {
  home.username = "aaron";
  home.homeDirectory = "/home/aaron";
  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "Aaron Dev";
    userEmail = "aaron";
  };

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [ lua-language-server ];
  };

 home.packages = with pkgs; [
  ] ++ (if !isVPS then [
    firefox
    ghostty
    mattermost-desktop
    discord
    vscode
    jetbrains.idea-ultimate
  ] else []);
}
