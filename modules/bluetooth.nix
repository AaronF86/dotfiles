# Bluetooth configuration module
{ config, pkgs, ... }:

{
  # Enable bluetooth and management tools
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}