{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.vscode
    pkgs.jetbrains.idea-ultimate
    pkgs.jetbrains.rust-rover
    pkgs.neovim
    pkgs.rustup
    pkgs.gradle
    pkgs.maven
    pkgs.python3
    pkgs.ghc
    pkgs.docker
    pkgs.git
  ];
}
