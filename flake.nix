#------------------------------------#
#                                    #
#  Entry point for the system flake  #
#                                    #
#------------------------------------#

{
    description = "being a Nix System flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        nixos-config.url = "github:zimbatm/nixos-config";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
        };

    outputs = { self, nixpkgs, home-manager, ... }:
    let
        system = "x86_64-linux";
        pkgs = import nixpkgs { inherit system; };
    in {
        nixosConfigurations = {
            desktop = nixpkgs.lib.nixosSystem {
                system = system;
                modules = [
                    ./hosts/desktop.nix
                    home-manager.nixosModules.home-manager
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            users.aaron = import ./home-manager/home.nix;
                        };
                    }
                ];
            };

            laptop = nixpkgs.lib.nixosSystem {
                system = system;
                modules = [
                    ./hosts/laptop.nix
                    home-manager.nixosModules.home-manager
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            users.aaron = import ./home-manager/home.nix;
                        };
                    }
                ];
            };
        };

        homeConfigurations = {
            aaron = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.${system};
                modules = [
                    ./home-manager/home.nix
                ];
            };
        };
    };
}
