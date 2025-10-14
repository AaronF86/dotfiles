{ pkgs, pkgs-master, ... }:
{
  home.username = "aaron";
  home.homeDirectory = "/home/aaron";
  home.stateVersion = "25.05";

  programs.git.enable = true;

  home.packages = with pkgs; [
    xfce.thunar
    mattermost-desktop
    obs-studio
    vscode
    gradle
    jdk
    vesktop
    pkgs-master.foxglove-studio
  ];

  imports = [
    ../../homeModules/zen.nix
    ../../homeModules/ghostty.nix
    ../../homeModules/hyprland
    ../../homeModules/neovim
    ../../homeModules/fish.nix
  ];
}
