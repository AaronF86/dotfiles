```nix
{
  description = "Aaron's Dotfiles V4 - being my system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    eko.url = "github:Kyren223/eko";
  };

  outputs = { self, nixpkgs, home-manager, zen-browser, eko, ... }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      mkMachine = import ./lib/mkMachine.nix { inherit lib; };
    in {
      nixosConfigurations = {
        framework = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            (mkMachine {
              basics = {
                hostname = "framework";
                timezone = "Europe/London";
                users = [ "aaron" ];
                rootPassword = "root";
                enableSSH = true;
              };
              diskoConfig = ./disko/framework.nix;
            })
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.users.aaron = import ./home/aaron.nix;
            }
          ];
        };
      };
    };
}
```
