{config, pkgs, ...}:

{
  # services.ly.enable = false; # Enable the ly display manager (disabled for now due to gnome)
  programs.hyprland.xwayland.enable = true;
  programs.hyprland.enable = true; # Enable the Hyperland program
}