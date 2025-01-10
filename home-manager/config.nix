{ config, pkgs, inputs, ... }:

{
  imports = [
    ./programs/vscode.nix
    ./programs/fish.nix
    ./programs/bash.nix
    ./programs/neovim.nix
    ./programs/rust.nix
    ./programs/java.nix
    ./programs/docker.nix
    ./programs/krita.nix
    ./programs/steam.nix
    ./programs/prism-launcher.nix
  ];
}
