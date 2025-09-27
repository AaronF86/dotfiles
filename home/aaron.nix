{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    fish
  ];

  home.stateVersion = "25.05";
}