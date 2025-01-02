{ config, pkgs, ... }:  # This line is required to pass `pkgs`

{
  imports = [
    ./hardware-configuration.nix
  ];

  # System settings
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "framework";
  networking.useDHCP = false;
  networking.networkmanager.enable = true;

  # Internationalization
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Timezone
  time.timeZone = "America/Los_Angeles";

  # Package management
  environment.systemPackages = with pkgs; [
    # Desktop Environmen
        firefox
        konsole
    bash

    # IDEs and Editors
    vscode
    neovim

    # Programming Languages and Tools
    rustup
    rust-analyzer
    openjdk
    gradle
    maven
    python3
   # haskell.compiler.ghc
    docker
    git

    # Communication Tools
    mattermost-desktop
    vesktop

    # Graphics and Design
    krita

    # Gaming
    steam
#    prism-launcher
  ];

  # Enable Docker
  virtualisation.docker.enable = true;


  # Enable and configure graphical environment
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.libinput.enable = true;

  # Enable Wayland support
  services.xserver.windowManager.i3.enable = false;

  # Unfree software allowance (e.g., IntelliJ)
  nixpkgs.config.allowUnfree = true;

  # Enable gaming support
  hardware.opengl.enable = true;

  # Define user account
  users.users.aaron = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
  };

  # System state version
  system.stateVersion = "23.05"; # Update this based on your NixOS version
}
