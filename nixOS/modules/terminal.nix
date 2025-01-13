{ config, pkgs, ... }:

{
  programs.fish.enable = true;
  environment.systemPackages = [ 
  pkgs.ghostty 
  pkgs.tree
  ];
}
