{
  meta = {
    hostname = "framework";
    system = "x86_64-linux";
    description = "Laptop for Aaron";
    users = {
      # UserName    |     UseHomeManager
      aaron         =              true;   
    };
  };

  modules = [
    ./disko.nix               # <-|
    ./modules/boot.nix        # <-| Maybe make these 3 into mandatory modules and place them in the mkMachine call?
    ./modules/networking.nix  # <-| 
    ../../modules/common.nix
    ../../modules/DesktopEnvironments/hyprland.nix
    ../../modules/loginManagers/ly.nix
    ./modules/hardware.nix
  ];
}
