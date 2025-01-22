{ config, pkgs, ... }:

{
  imports = [
    ../modules/kde.nix
    ../modules/terminal.nix
    ../modules/development.nix
    ../modules/gaming.nix
    ../modules/communication.nix
    ./hardware-configuration-desktop.nix
  ];

  # Bootloader Configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";
  };

  # Graphics Configuration
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;  # Set to true for laptops to save power
    powerManagement.finegrained = false;
    open = false;  # Use proprietary drivers
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Steam Configuration
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # System Version
  system.stateVersion = "24.11";
}
