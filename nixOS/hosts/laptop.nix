{ config, pkgs, ... }:

{
  imports = [
    ../modules/kde.nix
    ../modules/terminal.nix
    ../modules/development.nix
    ../modules/gaming.nix
    ../modules/communication.nix
    ./hardware-configuration-laptop.nix
  ];

  

  networking.useDHCP = false;
  networking.networkmanager.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";
  };

  system.stateVersion = "24.11";
}
