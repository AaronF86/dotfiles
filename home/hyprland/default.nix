{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    
    settings = {
      monitor = [
        "DP-2,preferred,0x0,1"
        "HDMI-A-1,preferred,1920x0,1"
        "HDMI-A-2,preferred,3840x0,1"
      ];
      
      env = [
        "XCURSOR_SIZE,24"
        "QT_QPA_PLATFORMTHEME,qt5ct"
      ];
      
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = false;
        };
        sensitivity = 0;
      };
      
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
        allow_tearing = false;
      };
      
      decoration = {
        rounding = 10;
        
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        

      };
      
      animations = {
        enabled = false;
      };
      
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      
      
      gestures = {
        workspace_swipe = false;
      };
      
      misc = {
        force_default_wallpaper = -1;
      };
      
      workspace = [
        "1, monitor:HDMI-A-1, web, persistent:true"
        "2, monitor:HDMI-A-1, dev, persistent:true"
        "3, monitor:HDMI-A-1, test, persistent:true"
        "4, monitor:HDMI-A-1, game, persistent:true"
        "5, monitor:HDMI-A-2, persistent:true"
        "6, monitor:DP-2, persistent:true"
      ];
      
      exec-once = [
        "waybar"
        "dunst"
        "hyprpaper"
      ];
    };
  };
}