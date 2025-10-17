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
  ];

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

  nix.settings = {
    experimental-features = [ "flakes" "nix-command" ];
  };
}
