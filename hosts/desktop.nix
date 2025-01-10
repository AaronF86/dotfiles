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
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";
  };

  hardware.opengl.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    prime = { sync.enable = true; offload.enable = true; };
  };

    system.stateVersion = "24.11";
}
