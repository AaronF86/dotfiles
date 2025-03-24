{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration-laptop.nix # Hardware configuration
    ../common.nix # Common configuration for all systems
    ../modules/hyperland.nix # Hyperland-specific configuration
    ../modules/gnome.nix # Gnome-specific configuration
    ../modules/temp.nix # Temporary configuration
  ];


# localisation 
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "uk";
    defaultLocale = "en_GB.UTF-8";
  };
  
  # Taken from ScottCowe
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  services.blueman.enable = true;

  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    };
  };

  security.rtkit.enable = true;


  networking.useDHCP = false;
  networking.networkmanager.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";
  };

}
