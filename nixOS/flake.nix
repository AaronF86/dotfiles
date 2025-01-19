{
  description = "A simple and flexible Nix flake.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
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
            ./users/user.nix
            home-manager.nixosModules.home-manager
            {
              nixpkgs.config.allowUnfree = true;
            }
          ];
        };

        laptop = nixpkgs.lib.nixosSystem {
          system = system;
          modules = [
            ./hosts/laptop.nix
            ./users/user.nix
            home-manager.nixosModules.home-manager
            {
              nixpkgs.config.allowUnfree = true;
            }
          ];
        };
      };

      homeConfigurations = {
        user = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [
            ./home-manager/config.nix
            {
              nixpkgs.config.allowUnfree = true;
            }
          ];
        };
      };
    };
}
