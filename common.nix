#--------------------------------------#
#                                      #
#  Common Config/Packages for system   #
#                                      #
#--------------------------------------#

{config, pkgs, ...}:

{
  imports = [
    ./user.nix
  ];

  #bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";
  };
  boot.supportedFilesystems = [ "ntfs" ];

  #Nix Config
  system.stateVersion = "24.11";
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #Default packages
  environment.systemPackages = with pkgs; [
    python3 # used for scripts

    # cli tools
    tree
    htop
    fastfetch
    neovim
    home-manager
  ];

  programs.firefox.enable = true;
    virtualisation.docker.enable = true;

  #sound
    services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
   };  
}