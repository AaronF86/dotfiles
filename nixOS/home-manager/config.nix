{ config, pkgs, inputs, ... }:

let
  dotfiles = "/home/aaron/dotfiles";
in {
  # Basic user settings
  home.username = "aaron";
  home.homeDirectory = "/home/aaron";

  # Manage dotfiles
  home.file.".config/fish".source = "${dotfiles}/fish";
  home.file.".config/ghostty".source = "${dotfiles}/ghostty/config";

  # Import Fish configuration
  imports = [
    ./programs/fish.nix
  ];

  # Add other packages
  home.packages = with pkgs; [
    git
    htop
    ripgrep
  ];

  # State version
  home.stateVersion = "25.05";
}

