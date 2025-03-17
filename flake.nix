#------------------------------------#
#                                    #
#  Entry point for the system flake  #
#                                    #
#------------------------------------#

{
    # A short description of the flake
    description = "being a Nix System flake";

    # Dependencies of the flake (inputs)
    inputs = {
        # The NixOS unstable channel (newest packages)
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        nixos-config.url = "github:zimbatm/nixos-config";

        # Home Manager (user-level configuration)
        home-manager.url = "github:nix-community/home-manager"; # Allows management of user-level configurations like dotfiles
    };

    # Outputs the system configuration (the main body of the flake)
    outputs = { self, nixpkgs, home-manager, ... }: 
        let
        # Defines the target system architecture (may need to change if I ever get a system with a different architecture)
        system = "x86_64-linux"; 
        # Imports the Nixpkgs (system package set) for the desired system
        pkgs = import nixpkgs { inherit system; };
        in {
            # Configurations for NixOS systems (desktop and laptop configurations)
            nixosConfigurations = {
                # Configuration for my desktop
                desktop = nixpkgs.lib.nixosSystem {
                    system = system; 
                    modules = [
                        ./hosts/desktop.nix # Desktop-specific configuration
                        home-manager.nixosModules.home-manager # Home Manager integration
                    ];
                };

                # Configuration for the laptop system
                laptop = nixpkgs.lib.nixosSystem {
                    system = system; 
                    modules = [
                        ./hosts/laptop.nix # Laptop-specific configuration
                        home-manager.nixosModules.home-manager # Home Manager integration
                    ];
                };
            };

            # Configurations for home-manager (user configurations)
            homeConfigurations = {
                user = home-manager.lib.homeManagerConfiguration {
                    pkgs = nixpkgs.legacyPackages.${system}; # Use the appropriate package set for the system
                    modules = [
                        ./home-manager/home.nix # User-specific
                    ];
                };
            };
        };
}
