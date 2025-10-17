{ pkgs, pkgs-master, ... }:
{
  home.username = "aaron";
  home.homeDirectory = "/home/aaron";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    xfce.thunar
    mattermost-desktop
    obs-studio
    vscode
    gradle
    jdk
    vesktop
    pkgs-master.foxglove-studio
    jetbrains.idea-ultimate


    # Development Tools
    clang-tools
    nil # Nix LSP
    nixpkgs-fmt # Nix formatter
    rust-analyzer # Rust LSP
    clippy # Rust linter
  ];

  imports = [
    ../../homeModules/zen.nix
    ../../homeModules/ghostty.nix
    ../../homeModules/hyprland
    ../../homeModules/neovim
    ../../homeModules/fish.nix
    ../../homeModules/git.nix
    ../../homeModules/ssh.nix
  ];
}
