{ config, pkgs, ... }:

{
    imports = [
    ../modules/gnome.nix
    ../hardware/desktop-hardware-configuration.nix
    ];

  environment.systemPackages = with pkgs; [
  ];

  programs.fish.enable = true;
}
