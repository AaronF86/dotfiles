#
# Git configuration
#

{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Aaron";  # Corrected to userName for NixOS config
    userEmail = "aaronfultont86@gmail.com";  # Corrected to userEmail for NixOS config
  };
}
