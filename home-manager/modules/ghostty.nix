{ pkgs, ... }:

{
    home.packages = with pkgs; [
    ghostty
    ];

  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    installVimSyntax = true;

    settings = {
      font-family = "JetBrainsMono Nerd Font";
      font-size = 14;
      unfocused-split-opacity = 0.95;
      theme = "OneHalfDark";
    };
  };
}
