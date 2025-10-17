{ config, pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
  };

  hardware = {
    enableAllFirmware = true;
    firmware = [ pkgs.linux-firmware ];
    cpu.amd.updateMicrocode = true;
    graphics.enable = true;
  };

  networking.networkmanager.enable = true;

  services = {
    tlp.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
    fstrim = {
      enable = true;
      interval = "weekly";
    };
  };

  # nix.gc = {
  # automatic = true;
  # dates = "weekly";
  # options = "--delete-older-than 7d";
  # };
  # systemd.services.nix-gc.enable = false;
}
