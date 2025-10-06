{ pkgs, ... }:
{
  home.username = "aaron";
  home.homeDirectory = "/home/aaron";
  home.stateVersion = "25.05";

  programs.git.enable = true;

  home.packages = [
    pkgs.fastfetch
  ];

  imports = [
    ../../homeModules/zen.nix
    ../../homeModules/ghostty.nix
  ];
}
