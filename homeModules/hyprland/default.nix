{pkgs, lib, config, ...}:

{
    imports = [ 
        ./binds.nix
        ./hyprpaper.nix
        ./waybar.nix
        ./dunst.nix
        ./wofi.nix
    ];

    wayland.windowManager.hyprland = {
    enable = true;
    
    settings = {
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
      
      
      misc = {
        force_default_wallpaper = -1;
      };
       exec-once = [
        "waybar"
        "dunst"
        "hyprpaper"
      ];
    };
  };

    home.packages = with pkgs; [
    way-displays
  ];
}