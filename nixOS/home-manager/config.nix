{ config, pkgs, ... }:

{
  home.username = "aaron";
  home.homeDirectory = "/home/aaron";

  imports = [
    ./programs/fish.nix
  ];

  home.packages = with pkgs; [
    git
    htop
    ripgrep
  ];

  home.stateVersion = "23.05";
}
