{ config, pkgs, ... }:

{
  imports = [
    ../modules/kde.nix
    ../modules/terminal.nix
    ../modules/development.nix
    ../modules/gaming.nix
    ../modules/communication.nix
    ./hardware-configuration-laptop.nix
  ];


# localisation 
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "uk";
    defaultLocale = "en_GB.UTF-8";
  };
  
  # Taken from ScottCowe
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  services.blueman.enable = true;

  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    };
  };

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
  };

  networking.useDHCP = false;
  networking.networkmanager.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";
  };

  system.stateVersion = "24.11";

    environment.etc."ssh/id_ed25519_laptop".source = "/home/aaron/.ssh/id_ed25519_laptop";
  environment.etc."ssh/id_ed25519_laptop.pub".source = "/home/aaron/.ssh/id_ed25519_laptop.pub";

  environment.etc."ssh/config".text = ''
    Host github.com
      HostName github.com
      User git
      IdentityFile ~/.ssh/id_ed25519_laptop

    Host gitlab.cis.strath.ac.uk
      HostName gitlab.cis.strath.ac.uk
      User git
      IdentityFile ~/.ssh/id_ed25519_laptop
  '';
}
