{ config, pkgs, ... }:

{
  home.username = "aaron";
  home.homeDirectory = "/home/aaron";

  imports = [
    ../modules/git.nix
    ../modules/ghostty.nix
  ];

  home.packages = with pkgs; [
  ];

  home.sessionVariables = {
    PATH = "${pkgs.cargo}/bin:$HOME/.cargo/bin:$PATH";
  };

  home.stateVersion = "25.05";
}