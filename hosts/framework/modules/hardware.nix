{ config, pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "amd_pstate=active" ];
    blacklistedKernelModules = [ "k10temp" ];
    extraModulePackages = [ config.boot.kernelPackages.zenpower ];
    kernelModules = [ "zenpower" ];
  };

  hardware = {
    enableAllFirmware = true;
    firmware = [ pkgs.linux-firmware ];
    cpu.amd.updateMicrocode = true;
    bluetooth.enable = true;
    graphics.enable = true;
  };

  networking.networkmanager.enable = true;

  services = {
    tlp.enable = true;

    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      libinput.enable = true;
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };

    fprintd.enable = true;
    fstrim = {
      enable = true;
      interval = "weekly";
    };
  };

    nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
    };
    systemd.services.nix-gc.enable = false;
}
