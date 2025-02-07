{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    plugins = [
      {
        name = "tide";
        src = pkgs.fishPlugins.tide;
      }
    ];

    # Custom shell initialization
    interactiveShellInit = "";
  };
}