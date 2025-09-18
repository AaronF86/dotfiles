{
  description = "being a simple nixos flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Eko app (client/server) flake
    eko.url = "github:Kyren223/eko";
  };

  outputs = { nixpkgs, home-manager, flake-utils, zen-browser, ... }@inputs:
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
                home-manager.extraSpecialArgs = { inherit inputs; };
              }
            ];
          };
        }
        {
          name = "desktop-${system}";
          value = nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = { inherit inputs; };
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
                home-manager.extraSpecialArgs = { inherit inputs; };
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
                home-manager.extraSpecialArgs = { inherit inputs; };
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
        extraSpecialArgs = { inherit inputs; };
      };
    }) systems);
  };

  
}
