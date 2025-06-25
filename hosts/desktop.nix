{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration-desktop.nix # Hardware configuration
    ../common.nix # Common configuration for all systems
    ../modules/nvidia.nix # Nvidia drivers
    ../modules/hyperland.nix # Hyperland-specific configuration
    ../modules/gnome.nix # Gnome-specific configuration
    ../modules/temp.nix # Temporary configuration
  ];

  # hostname
  networking.hostName = "Aaron-Desktop";  # Adjusted to avoid apostrophes

  # localisation
  console.keyMap = "us"; # Keyboard layout
  console.font = "Lat2-Terminus16";
  time.timeZone = "Europe/London";
  i18n = { 
    defaultLocale = "en_GB.UTF-8";
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
