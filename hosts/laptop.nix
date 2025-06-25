{ config, pkgs, ... }:

{
    imports = [
    ../modules/gnome.nix
    ../hardware/laptop-hardware-configuration.nix
    ];

  environment.systemPackages = with pkgs; [
  ];


  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/nvme0n1";
  };

  programs.fish.enable = true;
}
