{
  description = "Aaron's Dotfiles V4 - being my system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    eko.url = "github:Kyren223/eko";
    agenix.url = "github:ryantm/agenix";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, disko, zen-browser, agenix, ... }:
  let
    lib = nixpkgs.lib;
    mkUsers = import ./lib/mkUsers.nix { inherit lib home-manager; userPath = ./user; homePath = ./home; };
    mkMachine = import ./lib/mkMachine.nix { inherit lib nixpkgs home-manager mkUsers disko zen-browser agenix; };

    discoverHosts = import ./lib/discoverHosts.nix { inherit lib; };
    hosts = discoverHosts { path = ./hosts; };
  in
  {
    nixosConfigurations = lib.mapAttrs (_: host: mkMachine host) hosts;
  };
}

