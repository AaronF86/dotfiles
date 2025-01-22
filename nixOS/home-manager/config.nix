{ config, pkgs, ... }:

{
  home.username = "aaron";
  home.homeDirectory = "/home/aaron";

  imports = [
    ./programs/fish.nix
    ./programs/ghostty.nix
    ./programs/vscode.nix
  ];

  home.packages = with pkgs; [
    git
    htop
    ripgrep
  ];

  home.stateVersion = "25.05";
}
