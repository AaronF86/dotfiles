{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;  # Switch to GDM, which is the recommended display manager for GNOME
  services.desktopManager.gnome.enable = true;

  services.libinput.enable = true;  # Keep input support enabled

  # Disable KDE Plasma and SDDM
  services.displayManager.sddm.enable = false;
  services.desktopManager.plasma6.enable = false;

  # Disable other window managers (like i3) if not needed
  services.xserver.windowManager.i3.enable = false;
}
