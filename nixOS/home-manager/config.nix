{ config, pkgs, ... }:

{
  home.username = "aaron";
  home.homeDirectory = "/home/aaron";

  imports = [
    ./programs/fish.nix
    ./programs/ghostty.nix
    ./programs/vscode.nix
    ./programs/nvim.nix
  ];

  home.packages = with pkgs; [
    git
    htop
    ripgrep
  ];

  home.sessionVariables = {
    PATH = "${pkgs.cargo}/bin:$HOME/.cargo/bin:$PATH";
  };

  home.stateVersion = "25.05";
}
