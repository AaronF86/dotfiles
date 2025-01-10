{
  description = "Being a simple flexible Nix flake.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/desktop.nix
          ./users/user.nix
          {
            nixpkgs.config.allowUnfree = true;
          }
          home-manager.nixosModules.home-manager
          ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/laptop.nix
          ./users/user.nix
          {
            nixpkgs.config.allowUnfree = true;
          }
          home-manager.nixosModules.home-manager
        ];
      };
    };

    homeConfigurations = {
      user = home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
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
