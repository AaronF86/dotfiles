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
    pkgs.zulu #Java 21

    #Uni Tools
    pkgs.mars-mips #MIPS Assembler :3
    pkgs.armips
  ];
virtualisation.docker.enable = true;
}
