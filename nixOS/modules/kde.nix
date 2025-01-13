{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.libinput.enable = true;
  

  # Enable Wayland support
  services.xserver.windowManager.i3.enable = false;
}
