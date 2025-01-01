{
  description = "Being a NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty = {
      url = "github:ghostty-org/ghostty";
    };
  };

  outputs = inputs@{ self, home-manager, nixpkgs, nur, ... }: let
    system = "x86_64-linux"; # Current system architecture
    pkgs = nixpkgs.legacyPackages.${system}; 
    lib = pkgs.lib;

    # Helper function to create a system configuration
    mkSystem = { pkgs, hostname }: 
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          { networking.hostName = hostname; }
          # General configuration (users, networking, sound, etc)
          ./system/configuration.nix
          # Hardware config (bootloader, kernel modules, filesystems, etc)
          ./hosts/${hostname}/hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useUserPackages = true;
              useGlobalPkgs = true;
              extraSpecialArgs = { inherit inputs; };
              # Correct user configuration reference
              users.aaron = ./hosts/${hostname}/user.nix;
            };
          }
        ];
        specialArgs = { inherit inputs; };
      };

  in {
    nixosConfigurations = {
      # Define multiple systems using mkSystem
      framework = mkSystem { pkgs = pkgs; hostname = "framework"; };
    };
  };
}
