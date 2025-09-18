{ config, pkgs, ... }:
{
  programs.wofi = {
    enable = true;
    settings = {
      location = "bottom-right";
      allow_markup = true;
      width = 250;
    };
    style = ''
      /* Add custom CSS styling here */
    '';
  };
}
