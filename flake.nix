{
    description = "Aaron's Dotfiles V4 - being my system configuration";

    # Some Nice stuff to make it easy to create
    inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";     # Keep everything pinned to the stable branch
    inputs.unstable.url = "github:NixOS/nixpkgs/nixos-unstable"; # For when the stable stuff breaks (always, Im looking at you Vesktop)
    inputs.flake-utils.url = "github:numtide/flake-utils";       # I have no idea what this does, but its in every flake I see 
    inputs.home-manager.url = "github:nix-community/home-manager"; # User Management init :3
    inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";      # pin home-manager to the same nixpkgs as the rest of the flake
    inputs.zen-browser.url = "github:unofficial-zen-browser/zen-browser";
    inputs.zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    inputs.eko.url = "github:Kyren223/eko";


    outputs = { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
      mkMachine = import ./lib/mkMachine.nix { inherit nixpkgs; };

      machines = {
        framework = import ./machines/laptop.nix;
        desktop = import ./machines/laptop.nix;
      };
    in {
      nixosConfigurations = lib.mapAttrs (_: mkMachine) machines;
    };
}