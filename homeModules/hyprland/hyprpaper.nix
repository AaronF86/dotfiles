{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [
        "~/Pictures/wallpapers/wallpaper1.png"
      ];

      wallpaper = [ ",~/Pictures/wallpapers/wallpaper1.png" ];
    };
  };

  home.file."Pictures/wallpapers/.keep".text = "";

  home.packages = with pkgs; [
    hyprpaper
  ];
}
