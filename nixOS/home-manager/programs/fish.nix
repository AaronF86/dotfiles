{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    # Disable default greeting
    interactiveShellInit = ''
      set fish_greeting
    '';

    plugins = [
      # Tide plugin from GitHub
      {
        name = "tide";
        src = pkgs.fetchFromGitHub {
          owner = "IlanCosman";
          repo = "tide";
          rev = "6fc5cb340a51fba77f5e7c8e39bc6dfc97094708"; # Example commit SHA
          sha256 = "1y6ngfx9scc2lwdrkm68lppr3dhm4ghqac27lfckfgaazk2kppp9";
        };
      }
    ];
  };
}

