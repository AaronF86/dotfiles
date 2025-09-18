{ config, lib, pkgs, ... }:

{
  config = {
    services = {
      xserver = {
        enable = true;
        displayManager.gdm.enable = false;
        desktopManager.gnome.enable = true;
      };
    };
  };
}
