{ config, pkgs, ... }:

{
  programs.fish.enable = true;
  environment.systemPackages = [ 
  pkgs.tree
  pkgs.fastfetch
  ];
}
