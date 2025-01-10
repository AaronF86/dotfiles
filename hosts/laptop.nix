{ config, pkgs, ... }:

{
  imports = [
    ../modules/kde.nix
    ../modules/terminal.nix
    ../modules/development.nix
    ../modules/communication.nix
    ./hardware-configuration-laptop.nix
  ];
}
