{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    fish
  ];

  stateVersion = "25.05";
}