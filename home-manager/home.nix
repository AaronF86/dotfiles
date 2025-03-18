{ config, pkgs, ... }:

{

  home.username = "aaron";
  home.homeDirectory = "/home/aaron";

    programs.home-manager.enable = true;


  imports = [
    ../home-manager/modules/git.nix
    ../home-manager/modules/ghostty.nix
    ../home-manager/modules/hyperland.nix
        ../home-manager/modules/rofi.nix
        ../home-manager/modules/waybar.nix

  ];

  home.packages = with pkgs; [
  ];

  home.sessionVariables = {
    PATH = "${pkgs.cargo}/bin:$HOME/.cargo/bin:$PATH";
  };

  home.stateVersion = "25.05";
}