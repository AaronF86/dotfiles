# Common module configurations for all NixOS hosts.

{ config, lib, pkgs, ... }:

{
  # Standard system packages
  environment.systemPackages = with pkgs; [
    neovim
    git
    curl
    tree
    wget
    zip
    unzip
    brightnessctl
    playerctl
    rclone
  ];

services.orca.enable = true;
  # Locale settings
  i18n = {
    defaultLocale = "en_GB.UTF-8";
    supportedLocales = [ "all" ];
  };

  # Timezone settings
  time.timeZone = "Europe/London";

  nixpkgs.config = {
    allowUnfree = true;
  };

  programs.fish.enable = true;

  virtualisation.docker.enable = true;

  # Enable power management
  services.upower = {
    enable = true;
    percentageLow = 15;
    percentageCritical = 5;
    percentageAction = 3;
  };

  nix.settings = {
    experimental-features = [ "flakes" "nix-command" ];
  };
}
