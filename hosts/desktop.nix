{ config, pkgs, inputs, ... }:

{
    imports = [
    ../modules/desktop.nix
    ../hardware/desktop-hardware-configuration.nix
    ];

  # Boot configuration for UEFI system
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable Nix flakes and commands
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      trusted-users = [ "root" "aaron" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  # Swap configuration - 32GB swapfile
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 32768; # 32GB in MB (32 * 1024)
    }
  ];

  # Optional: Configure swappiness (how aggressively to use swap)
  # Lower values (like 10) prefer to use RAM more, higher values use swap more readily
  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
    "vm.vfs_cache_pressure" = 50;
  };

  environment.systemPackages = with pkgs; [
  ];

  programs.fish.enable = true;

virtualisation.docker.enable = true;



  home-manager.backupFileExtension = "backup";
}
