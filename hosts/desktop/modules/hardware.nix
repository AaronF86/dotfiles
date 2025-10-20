{ config, pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
  };

  hardware = {
    enableAllFirmware = true;
    firmware = [ pkgs.linux-firmware ];
    cpu.amd.updateMicrocode = true;
  };


  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true; # see the note above



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


  programs.steam = {
    enable = true; # Master switch, already covered in installation
    remotePlay.openFirewall = true; # For Steam Remote Play
    dedicatedServer.openFirewall = true; # For Source Dedicated Server hosting
    # Other general flags if available can be set here.
  };
  # Tip: For improved gaming performance, you can also enable GameMode:
  programs.gamemode.enable = true;
}
