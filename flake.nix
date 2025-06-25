{
  description = "being a simple nixos flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, flake-utils, ... }:
  let
    systems = flake-utils.lib.defaultSystems;
  in
  {
    nixosConfigurations = builtins.listToAttrs (builtins.concatLists (
      map (system: [
        {
          name = "laptop-${system}";
          value = nixpkgs.lib.nixosSystem {
            inherit system;
            
            modules = [
              ./hosts/laptop.nix
              ./modules/common.nix
              ./users/users.nix
              home-manager.nixosModules.home-manager
              {
                nixpkgs.config.allowUnfree = true;
                home-manager.useUserPackages = true;
                home-manager.useGlobalPkgs = true;
                home-manager.users.aaron = import ./users/aaron.nix;
              }
            ];
          };
        }
        {
          name = "desktop-${system}";
          value = nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [
              ./hosts/desktop.nix
              ./modules/common.nix
              ./users/users.nix
              home-manager.nixosModules.home-manager
              {
                nixpkgs.config.allowUnfree = true;
                home-manager.useUserPackages = true;
                home-manager.useGlobalPkgs = true;
                home-manager.users.aaron = import ./users/aaron.nix;
              }
            ];
          };
        }
        {
          name = "vps-${system}";
          value = nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [
              ./hosts/vps.nix
              ./modules/common.nix
              ./users/users.nix
              home-manager.nixosModules.home-manager
              {
                nixpkgs.config.allowUnfree = true;
                home-manager.useUserPackages = true;
                home-manager.useGlobalPkgs = true;
                home-manager.users.aaron = import ./users/aaron.nix;
              }
            ];
          };
        }
      ]) systems)
    );

    homeConfigurations = builtins.listToAttrs (map (system: {
      name = "aaron-${system}";
      value = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [ ./users/aaron.nix ];
      };
    }) systems);
  };

  
}
