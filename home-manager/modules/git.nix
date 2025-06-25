#
# Git configuration
#

{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Aaron";
    userEmail = "aaronfulton86@gmail.com";
  };
}
