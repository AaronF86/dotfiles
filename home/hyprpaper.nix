{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
      
      # Preload wallpapers - you can add your own wallpaper paths here
      preload = [
        "~/Pictures/wallpapers/wallpaper1.jpg"
        "~/Pictures/wallpapers/wallpaper2.jpg"
        "~/Pictures/wallpapers/wallpaper3.jpg"
      ];
      
      # Set wallpapers for each monitor
      wallpaper = [
        "DP-2,~/Pictures/wallpapers/wallpaper1.jpg"
        "HDMI-A-2,~/Pictures/wallpapers/wallpaper2.jpg"
        "HDMI-A-1,~/Pictures/wallpapers/wallpaper3.jpg"
      ];
    };
  };

  # Create wallpapers directory and add some default wallpapers
  home.file."Pictures/wallpapers/.keep".text = "";
  
  # Add hyprpaper to home packages to ensure it's available
  home.packages = with pkgs; [
    hyprpaper
  ];
}
