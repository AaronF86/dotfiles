{
  description = "Aaron's Dotfiles V4 - being my system configuration";


  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.home-manager.url = "github:nix-community/home-manager";
  inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";
  inputs.zen-browser.url = "github:0xc000022070/zen-browser-flake";
  inputs.zen-browser.inputs.nixpkgs.follows = "nixpkgs";
  inputs.eko.url = "github:Kyren223/eko";


}
